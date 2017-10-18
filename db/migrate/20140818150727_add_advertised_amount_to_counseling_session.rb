class AddAdvertisedAmountToCounselingSession < ActiveRecord::Migration
  def change
    add_column :counseling_sessions, :adv_amount, :decimal
  end
end
