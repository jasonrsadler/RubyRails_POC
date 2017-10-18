class RemoveProviderRegistrations < ActiveRecord::Migration
  def change
    drop_table :provider_registrations
  end
end
