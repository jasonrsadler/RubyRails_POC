class AddClientToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :client, index: true
  end
end
