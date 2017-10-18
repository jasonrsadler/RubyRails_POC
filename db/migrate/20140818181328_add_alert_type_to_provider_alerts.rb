class AddAlertTypeToProviderAlerts < ActiveRecord::Migration
  def change
    add_column :provider_alerts, :alert_type, :int
  end
end
