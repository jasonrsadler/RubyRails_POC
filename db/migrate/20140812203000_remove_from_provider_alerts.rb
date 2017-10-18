class RemoveFromProviderAlerts < ActiveRecord::Migration
  def change
    remove_reference :provider_alerts, :client_id, index: true
    remove_reference :provider_alerts, :provider_id, index:true
  end
end
