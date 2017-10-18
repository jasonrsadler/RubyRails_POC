class AddCvvToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :cvv, :string
  end
end
