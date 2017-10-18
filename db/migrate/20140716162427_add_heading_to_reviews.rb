class AddHeadingToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :heading, :string
  end
end
