class AddImageToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :profile_image, :binary
  end
end
