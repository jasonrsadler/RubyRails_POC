class AddAmountToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :fund, index: true
    add_column :payments, :amount, :decimal
  end
end
