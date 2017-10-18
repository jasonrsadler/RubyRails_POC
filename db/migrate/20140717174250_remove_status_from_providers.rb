class RemoveStatusFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :status, :string
  end
end
