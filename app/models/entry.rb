class Entry < ActiveRecord::Base
  belongs_to :counseling_session
  validates :entry_text, presence:true
  validates :client_id, presence:true
  validates :provider_id, presence:true
  validates :entry_by_client, inclusion: [true, false]
  validates :entry_by_provider, inclusion: [true, false]
  validates :counseling_session_id, presence:true
  
  
  
end
