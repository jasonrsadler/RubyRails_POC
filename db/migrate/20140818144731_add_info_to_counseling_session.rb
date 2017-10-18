class AddInfoToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :amount_charged, :decimal
    add_column :counseling_sessions, :units_used, :int
  end
end
