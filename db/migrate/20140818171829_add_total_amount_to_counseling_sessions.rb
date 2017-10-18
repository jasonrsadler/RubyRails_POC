class AddTotalAmountToCounselingSessions < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :total_amount, :decimal
  end
end
