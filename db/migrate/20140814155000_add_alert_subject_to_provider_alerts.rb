class AddAlertSubjectToProviderAlerts < ActiveRecord::Migration
  def change
    add_column :provider_alerts, :alert_subject, :string
  end
end
