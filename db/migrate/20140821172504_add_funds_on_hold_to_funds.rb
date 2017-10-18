class AddFundsOnHoldToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :funds_on_hold, :decimal
  end
end
