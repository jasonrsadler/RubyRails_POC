class AddSessionTypeToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :session_type, :int
  end
end
