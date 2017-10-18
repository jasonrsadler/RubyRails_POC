class AddStripeToFund < ActiveRecord::Migration
  def change
    add_column :funds, :stripe_customer_token, :string
  end
end
