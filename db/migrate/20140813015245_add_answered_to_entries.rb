class AddAnsweredToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :answered, :bool
  end
end
