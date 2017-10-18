class AddSessionEndedToCounselingSessions < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :session_ended, :bool
  end
end
