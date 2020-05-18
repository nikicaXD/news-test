class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :position, null: false, default: 1

      t.references :album, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
