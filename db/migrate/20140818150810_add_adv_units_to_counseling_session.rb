class AddAdvUnitsToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :adv_units, :int
  end
end
