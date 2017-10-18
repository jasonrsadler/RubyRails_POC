class AddInfoToCards < ActiveRecord::Migration
  def change
    add_column :cards, :cc_f_4, :string
    add_column :cards, :cc_type, :string
  end
end
