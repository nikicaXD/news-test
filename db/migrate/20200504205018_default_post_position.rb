class DefaultPostPosition < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:posts, :position, 1)
  end
end
