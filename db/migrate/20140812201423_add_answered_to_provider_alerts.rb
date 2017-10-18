class AddAnsweredToProviderAlerts < ActiveRecord::Migration
  def change
    add_column :provider_alerts, :answered, :bool
  end
end
