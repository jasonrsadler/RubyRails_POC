class AddStatusToClientsAndProviders < ActiveRecord::Migration
  def change
    add_column :providers, :status, :string
    add_column :clients, :status, :string
  end
end
