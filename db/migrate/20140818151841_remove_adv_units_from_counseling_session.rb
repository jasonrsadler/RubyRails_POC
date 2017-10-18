class RemoveAdvUnitsFromCounselingSession < ActiveRecord::Migration
  def change
    remove_column :counseling_sessions, :adv_units, :int
  end
end
