class AddModifiedsToCounselingSessions < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :alt_time_specified, :bool
    add_column :counseling_sessions, :alt_time, :int
  end
end
