class CreatePlaylistPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_posts do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
