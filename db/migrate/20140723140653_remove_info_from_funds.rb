class RemoveInfoFromFunds < ActiveRecord::Migration
  def change
    remove_column :funds, :cc_f_4, :string
    remove_column :funds, :cc_type, :string
  end
end
