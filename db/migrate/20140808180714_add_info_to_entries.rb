class AddInfoToEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :client, index: true
    add_reference :entries, :provider, index: true
    add_reference :entries, :counseling_session, index: true
    add_column :entries, :entry_text, :string
    add_column :entries, :entry_by_client, :bool
    add_column :entries, :entry_by_provider, :bool
  end
end
