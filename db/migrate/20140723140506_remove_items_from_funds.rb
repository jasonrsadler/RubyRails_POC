class RemoveItemsFromFunds < ActiveRecord::Migration
  def change
    remove_column :funds, :cc_num, :string
    remove_column :funds, :exp_date, :string
    remove_column :funds, :cvv, :string
    remove_column :funds, :address1, :string
    remove_column :funds, :address2, :string
    remove_column :funds, :city, :string
    remove_column :funds, :state, :string
    remove_column :funds, :zip, :string
    remove_column :funds, :name_on_card, :string
  end
end
