class AddInfoToCounselingSessions < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :is_created, :bool
    add_column :counseling_sessions, :provider_joined, :bool
  end
end
