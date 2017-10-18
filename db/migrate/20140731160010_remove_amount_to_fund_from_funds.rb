class RemoveAmountToFundFromFunds < ActiveRecord::Migration
  def change
    remove_column :funds, :amount_to_fund, :decimal
  end
end
