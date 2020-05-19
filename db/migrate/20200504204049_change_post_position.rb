class ChangePostPosition < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:posts, :position, nil)
  end
end
