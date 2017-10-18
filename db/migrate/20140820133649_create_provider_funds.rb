class CreateProviderFunds < ActiveRecord::Migration
  def change
    create_table :provider_funds do |t|

      t.timestamps
    end
  end
end
