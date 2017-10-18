class AddExpDateToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :exp_date, :string
  end
end
