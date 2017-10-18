class CreateClientReceipts < ActiveRecord::Migration
  def change
    create_table :client_receipts do |t|

      t.timestamps
    end
  end
end
