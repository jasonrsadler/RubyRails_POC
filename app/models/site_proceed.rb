class SiteProceed < ActiveRecord::Base
  belongs_to :client
  belongs_to :provider
  belongs_to :counseling_session
  belongs_to :site
end
