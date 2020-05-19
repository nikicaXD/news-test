class PlaylistPost < ApplicationRecord
  belongs_to :playlist
  belongs_to :post
end
