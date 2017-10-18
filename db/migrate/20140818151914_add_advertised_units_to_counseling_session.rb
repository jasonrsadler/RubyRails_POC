class AddAdvertisedUnitsToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :adv_units, :string
  end
end
