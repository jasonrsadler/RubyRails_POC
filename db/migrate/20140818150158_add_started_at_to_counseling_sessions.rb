class AddStartedAtToCounselingSessions < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :started_at, :timestamp
  end
end
