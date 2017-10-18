class AddBirthdateToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :birthdate, :date
  end
end
