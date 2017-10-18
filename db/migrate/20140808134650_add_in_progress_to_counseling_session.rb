class AddInProgressToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :in_progress, :bool
    add_column :counseling_sessions, :ended_at, :datetime
  end
end
