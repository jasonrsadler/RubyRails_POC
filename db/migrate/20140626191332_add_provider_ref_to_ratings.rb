class AddProviderRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :provider, index: true
  end
end
