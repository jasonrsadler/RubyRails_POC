class Proceed < ActiveRecord::Base
  belongs_to :provider
  belongs_to :counseling_session
end
