class AddClientProviderToCounselingSessions < ActiveRecord::Migration
  def change
    add_reference :counseling_sessions, :client, index: true
    add_reference :counseling_sessions, :provider, index: true
  end
end
