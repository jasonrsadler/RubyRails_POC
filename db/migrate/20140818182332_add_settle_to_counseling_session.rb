class AddSettleToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :charges_settled, :bool
  end
end
