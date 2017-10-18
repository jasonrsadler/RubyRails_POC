class AddSummaryToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :summary, :text
  end
end
