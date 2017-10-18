class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :provider, index: true
      t.references :user, index: true
      t.string :review

      t.timestamps
      execute "SELECT setval('user_id_seq', 10000)"
      execute "SELECT setval('provider_id_seq', 10000)"
      execute "SELECT setval('rating_id_seq', 10000)"
      execute "SELECT setval('review_id_seq', 10000)"
    end
  end
end
