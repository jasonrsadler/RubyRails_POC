class RemoveFalseClientIdFromCards < ActiveRecord::Migration
  def change
    remove_reference :cards, :client_id, index: true
  end
end
