class ChangeSongPosition < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:songs, :position, nil)
  end
end
