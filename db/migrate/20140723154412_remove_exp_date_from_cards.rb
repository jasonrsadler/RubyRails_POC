class RemoveExpDateFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :exp_date, :string
  end
end
