class AddToProviderAlerts < ActiveRecord::Migration
  def change
    add_reference :provider_alerts, :client, index: true
    add_reference :provider_alerts, :provider, index:true
  end
end
