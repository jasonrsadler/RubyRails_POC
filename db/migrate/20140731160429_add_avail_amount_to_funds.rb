class AddAvailAmountToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :avail_amount, :decimal
  end
end
