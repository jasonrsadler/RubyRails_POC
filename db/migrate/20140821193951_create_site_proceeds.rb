class CreateSiteProceeds < ActiveRecord::Migration
  def change
    create_table :site_proceeds do |t|
      t.references :client, index: true
      t.references :provider, index: true
      t.references :counseling_session, index: true
      t.decimal :total_session_amount
      t.decimal :provider_amount
      t.decimal :commission_amount
      t.decimal :commission_percentage

      t.timestamps
    end
  end
end
