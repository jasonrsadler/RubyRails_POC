class RemoveDescriptionFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :description, :string
  end
end
