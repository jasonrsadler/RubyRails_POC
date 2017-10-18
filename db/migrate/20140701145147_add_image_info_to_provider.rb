class AddImageInfoToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :filename, :string
    add_column :providers, :content_type, :string
    add_column :providers, :description, :string
  end
end
