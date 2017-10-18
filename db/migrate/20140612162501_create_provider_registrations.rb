class CreateProviderRegistrations < ActiveRecord::Migration
  def change
    create_table :provider_registrations do |t|

      t.timestamps
    end
  end
end
