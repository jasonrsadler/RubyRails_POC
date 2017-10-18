class AddFieldsToProviderFunds < ActiveRecord::Migration
  def change
    add_reference :provider_funds, :provider, index: true
    add_column :provider_funds, :avail_amount, :decimal
  end
end
