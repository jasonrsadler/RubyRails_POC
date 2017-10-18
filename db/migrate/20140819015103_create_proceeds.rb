class CreateProceeds < ActiveRecord::Migration
  def change
    create_table :proceeds do |t|
      t.references :provider, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
