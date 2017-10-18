class AddFieldsToClientReceipt < ActiveRecord::Migration
  def change
    add_reference :client_receipts, :client, index: true
    add_reference :client_receipts, :provider, index: true
    add_reference :client_receipts, :counseling_session, index: true
    add_column :client_receipts, :session_duration, :int
    add_column :client_receipts, :amount_charged, :decimal
  end
end
