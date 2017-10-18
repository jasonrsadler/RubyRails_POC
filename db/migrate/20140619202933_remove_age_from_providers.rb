class RemoveAgeFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :age, :int
  end
end
