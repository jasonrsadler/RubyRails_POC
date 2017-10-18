class AddAddressInfoToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :address1, :string
    add_column :providers, :address2, :string
    add_column :providers, :city, :string
    add_column :providers, :state, :string
  end
end
