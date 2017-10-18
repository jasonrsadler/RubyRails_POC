class AddZipToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :zip, :string
  end
end
