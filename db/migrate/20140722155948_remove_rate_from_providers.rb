class RemoveRateFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :rate, :int
  end
end
