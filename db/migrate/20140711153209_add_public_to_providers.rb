class AddPublicToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :public, :bool
  end
end
