class CreateCounselingSessions < ActiveRecord::Migration
  def change
    create_table :counseling_sessions do |t|
      
      t.timestamps
    end
  end
end
