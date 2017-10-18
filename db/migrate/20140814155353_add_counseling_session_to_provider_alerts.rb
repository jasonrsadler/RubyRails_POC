class AddCounselingSessionToProviderAlerts < ActiveRecord::Migration
  def change
    add_reference :provider_alerts, :counseling_session, index: true
  end
end
