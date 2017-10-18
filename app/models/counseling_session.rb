class CounselingSession < ActiveRecord::Base
  belongs_to :client
  belongs_to :provider
  has_many :entries
  has_many :provider_alerts
  has_many :client_receipts
  has_one :proceed
  has_one :site_fund
  attr_accessor :terms_of_service
  validates_acceptance_of :terms_of_service
  validates_presence_of :client, presence: true, message: " is required.", on: [:new, :show]
  validates_presence_of :provider, presence: true, message: " is required.", on: [:new, :show]
  
  
  
  def create_session
    if valid?
      self.is_created = true
      self.provider_joined = false;
      self.session_ended = false;
      self.charges_settled = false;
      save!
    end
  end

  def begin_entry_trail(provider_id)
    self.in_progress = true
    save!
    @entry = Entry.new
    @entry.client_id = client_id
    @entry.provider_id = self.provider_id
    @entry.counseling_session_id = self.id
    @entry.entry_text = "Session has started/is in progress"
    @entry.entry_by_client = true
    @entry.entry_by_provider = false
    @entry.save!
  end

  def create_provider_alert(alert_contents)
    @provider_alert = ProviderAlert.new
    @provider_alert.client = self.client
    @provider_alert.provider = self.provider
    @provider_alert.answered = false
    @provider_alert.alert_type = 1
    @provider_alert.counseling_session = alert_contents[:counseling_session]
    @provider_alert.alert_subject = alert_contents[:alert_subject]
    @provider_alert.alert_text = alert_contents[:alert_text]
    @provider_alert.save!
  end

  def update_avail_and_join
    if valid?
      self.provider_joined = true
      self.in_progress = true
      self.provider.status = 3
      
      self.provider.save!
      save!
      @entry = Entry.new
      @entry.client_id = client_id
      @entry.provider_id = self.provider_id
      @entry.counseling_session_id = self.id
      @entry.entry_text = "Provider has joined the session"
      @entry.entry_by_client = false
      @entry.entry_by_provider = true
      @entry.save!
    end
  end
  
  def update_client_joined
    self.started_at = DateTime.now
    save!
  end
  
  def make_provider_available
    self.provider.status = 2
    self.provider.save!
  end
  
  def update_session_end
    if !self.session_ended
      self.session_ended = true
    end
    if self.in_progress        
      self.in_progress = false;
    end
    if self.ended_at == nil
      self.ended_at = DateTime.now
    end
    self.session_duration = ((ended_at - started_at) / 60).ceil
    self.total_amount = self.adv_amount * self.session_duration
    self.client.fund.funds_on_hold = self.total_amount * 100
    self.client.fund.avail_amount = self.client.fund.avail_amount - self.client.fund.funds_on_hold
    self.client.fund.save!(validate: false)
    if self.session_ended
      @provider_alert = ProviderAlert.new
      @provider_alert.client = self.client
      @provider_alert.provider = self.provider
      @provider_alert.answered = false
      @provider_alert.alert_type = 2
      @provider_alert.counseling_session = self
      @provider_alert.alert_subject = "Charges for your session need settlement"
      @provider_alert.alert_text = "You currently ended a session that require charges to be settled."
      @provider_alert.save!
    end
    save!    
  end

  def settle_charges
    self.charges_settled = true
    self.alt_time_specified = false    
    self.client.fund.funds_on_hold = self.client.fund.funds_on_hold - self.total_amount * 100
    self.client.fund.save!(validate: false)
    if self.provider.provider_fund == nil
      self.provider.provider_fund = ProviderFund.new(provider: self.provider, avail_amount: (self.total_amount * 100) - ((self.total_amount * 100) * SITE_COMMISSION))
    else
      self.provider.provider_fund.avail_amount = self.provider.provider_fund.avail_amount + ((self.total_amount * 100) - ((self.total_amount * 100) * SITE_COMMISSION))
    end
    self.provider.provider_fund.save!
    @site_fund = SiteFund.find_by(id: 1)
    if @site_fund == nil
      @site_fund = SiteFund.new(avail_amount: (self.total_amount * 100) * SITE_COMMISSION)
    else
      @site_fund.avail_amount = @site_fund.avail_amount + ((self.total_amount * 100) * SITE_COMMISSION)
    end
    @site_fund.save!
    
    @proceed = Proceed.new(provider: self.provider, amount: self.total_amount, paid_to_provider: false, counseling_session: self)
    @client_receipt = ClientReceipt.new
    @client_receipt.client = self.client
    @client_receipt.provider = self.provider
    @client_receipt.counseling_session = self
    @client_receipt.session_duration = self.session_duration
    @client_receipt.amount_charged = self.total_amount
    @client_receipt.save!    
    save!
    
  end
end
