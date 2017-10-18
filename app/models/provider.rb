class Provider < ActiveRecord::Base
  has_many :reviews
  has_many :counseling_sessions
  has_many :provider_alerts
  has_many :proceeds
  has_one :provider_fund
  validates :first_name, presence: true, length: {minimum:2, maximum: 50}
  validates :last_name, presence: true, length: {minimum:2, maximum: 50}
  validates :birthdate, presence: true
  validate :dob_check, on: :create
  validates :address1, presence: true
  validates :city, presence: true
  validates_format_of :city, with: ->(provider) {/\A[a-zA-Z ]*\z/i}
  validates :state, presence: true
  validates :zip, presence: true, length: {is:5}
  validates :status, inclusion: {in: 1..3}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :validate_phone, on: [:create, :update]
  validates :filename, allow_blank: true, format:
                            { with: %r{\.gif|jpg|png}i, message: 'incorrect format'}
  validates_size_of :profile_image, maximum: 2.megabytes, message: "too large. Please limit to 2MB"
  validates_acceptance_of :terms_of_service, acceptance: true
  include Humanizer
  attr_accessor :bypass_humanizer, :sort_by
  require_human_on :create, unless: :bypass_humanizer
  include ActionView::Helpers::NumberHelper
  before_save :run_formatters
  def profile_img=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.profile_image = input_data.read
  end
  
  def set_status_online
    self.status = 2
    save!  
  end
  
  def set_status_unavail
    self.status = 3
  end
  
  def set_status_offline
    self.status = 1
  end
  
  private

  def run_formatters
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
    self.phone = number_to_phone(self.phone, area_code: true)
    self.address1 = self.address1.titleize
    self.city = self.city.titleize
    self.state = self.state.upcase
  end

  def dob_check
    if birthdate > 18.years.ago.to_date
      errors[:base] << "Must be 18 years of age to create an account. Those under 18 must have parent or guardian assistance."
    end
  end

  def validate_phone
    if phone.gsub(/\D/, "").length != 10
      errors[:base] << "Phone Number must have 3 digit area code followed by 7 digit number"
    else
      self.phone = number_to_phone(phone, area_code: true)
    end

    if !alt_phone.blank?
      if alt_phone.gsub(/\D/, "").length != 10
        errors[:base] << "Alternate Phone Number must have 3 digit area code followed by 7 digit number"
      else
        self.alt_phone = number_to_phone(alt_phone, area_code: true)
      end
    end
  end
end
