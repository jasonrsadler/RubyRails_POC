class AddPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :providers, :phone, :string
    add_column :providers, :alt_phone, :string
    add_column :users, :phone, :string
    add_column :users, :alt_phone, :string
  end
end
