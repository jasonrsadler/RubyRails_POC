class AddStatusToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :status, :int
  end
end
