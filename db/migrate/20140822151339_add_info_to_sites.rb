class AddInfoToSites < ActiveRecord::Migration
  def change
    add_column :sites, :first_name, :string
    add_column :sites, :last_name, :string
    add_column :sites, :birthdate, :date
    add_column :sites, :phone, :string
    add_column :sites, :alt_phone, :string
  end
end
