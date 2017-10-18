class AddAmountToFundToCards < ActiveRecord::Migration
  def change
    add_column :cards, :amount_to_fund, :decimal, precision: 8, scale: 2
  end
end
