class AddPaidToProceeds < ActiveRecord::Migration
  def change
    add_column :proceeds, :paid_to_provider, :bool
  end
end
