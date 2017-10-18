class AddHonorificToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :honorific, :string
  end
end
