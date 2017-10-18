class CreateSiteFunds < ActiveRecord::Migration
  def change
    create_table :site_funds do |t|
      t.decimal :avail_amount

      t.timestamps
    end
  end
end
