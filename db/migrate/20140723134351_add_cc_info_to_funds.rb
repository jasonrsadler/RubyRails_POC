class AddCcInfoToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :cc_f_4, :string
    add_column :funds, :cc_type, :string
  end
end
