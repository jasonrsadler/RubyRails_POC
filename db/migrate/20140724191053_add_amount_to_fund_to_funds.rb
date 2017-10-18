class AddAmountToFundToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :amount_to_fund, :decimal
  end
end
