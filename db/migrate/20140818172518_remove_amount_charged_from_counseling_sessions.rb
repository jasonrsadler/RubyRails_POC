class RemoveAmountChargedFromCounselingSessions < ActiveRecord::Migration
  def change
    remove_column :counseling_sessions, :amount_charged, :decimal
    remove_column :counseling_sessions, :units_used, :int
  end
end
