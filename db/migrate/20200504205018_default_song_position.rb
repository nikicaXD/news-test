class DefaultSongPosition < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:songs, :position, 1)
  end
end
