class AddTimestampsToFunds < ActiveRecord::Migration
  def change
    add_timestamps(:funds)
  end
end
