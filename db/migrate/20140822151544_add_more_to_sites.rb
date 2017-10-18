class AddMoreToSites < ActiveRecord::Migration
  def change
    add_column :sites, :address1, :string
    add_column :sites, :address2, :string
    add_column :sites, :city, :string
    add_column :sites, :state, :string
    add_column :sites, :zip, :string
  end
end
