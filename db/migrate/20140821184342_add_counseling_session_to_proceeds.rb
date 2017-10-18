class AddCounselingSessionToProceeds < ActiveRecord::Migration
  def change
    add_reference :proceeds, :counseling_session, index: true
  end
end
