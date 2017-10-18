class AddInfoToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :username, :string
    add_column :providers, :first_name, :string
    add_column :providers, :last_name, :string
    add_column :providers, :age, :int
  end
end
