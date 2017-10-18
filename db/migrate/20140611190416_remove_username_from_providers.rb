class RemoveUsernameFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :username, :string
  end
end
