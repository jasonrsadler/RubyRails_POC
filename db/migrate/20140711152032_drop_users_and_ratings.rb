class DropUsersAndRatings < ActiveRecord::Migration
  def change
    drop_table :users
    drop_table :ratings
  end
end
