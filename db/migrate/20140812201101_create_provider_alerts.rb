class CreateProviderAlerts < ActiveRecord::Migration
  def change
    create_table :provider_alerts do |t|
      t.references :provider_id, index: true
      t.references :client_id, index: true
      t.text :alert_text

      t.timestamps
    end
  end
end
