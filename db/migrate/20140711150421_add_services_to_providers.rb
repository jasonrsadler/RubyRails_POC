class AddServicesToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :service_by_phone, :bool
    add_column :providers, :service_by_chat, :bool
    add_column :providers, :service_by_email, :bool
  end
end
