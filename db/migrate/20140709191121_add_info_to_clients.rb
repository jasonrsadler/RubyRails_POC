class AddInfoToClients < ActiveRecord::Migration
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :birthdate, :date
    add_column :clients, :zip, :string
    add_column :clients, :address1, :string
    add_column :clients, :address2, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :phone, :string
    add_column :clients, :alt_phone, :string
  end
end
