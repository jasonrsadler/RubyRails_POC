class AddBillingAddressToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :address1, :string
    add_column :funds, :address2, :string
    add_column :funds, :city, :string
    add_column :funds, :state, :string
    add_column :funds, :zip, :string
    add_column :funds, :name_on_card, :string
  end
end
