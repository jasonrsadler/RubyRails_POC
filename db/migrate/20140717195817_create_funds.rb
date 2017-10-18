class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.integer :avail_amount
      t.string :cc_num
      end
  end
end
