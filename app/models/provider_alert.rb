class ProviderAlert < ActiveRecord::Base
  belongs_to :provider
  belongs_to :client
  belongs_to :counseling_session
  
  def mark_as_read
    self.answered = true
    save!
  end
end
