class AddChargeTokenToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :charge_token, :string
  end
end
