class AddClientsToFunds < ActiveRecord::Migration
  def change
    add_reference :funds, :client, index: true
  end
end
