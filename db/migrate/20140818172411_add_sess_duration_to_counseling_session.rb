class AddSessDurationToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :session_duration, :int
  end
end
