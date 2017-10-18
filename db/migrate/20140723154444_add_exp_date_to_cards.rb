class AddExpDateToCards < ActiveRecord::Migration
  def change
    add_column :cards, :exp_date, :date
  end
end
