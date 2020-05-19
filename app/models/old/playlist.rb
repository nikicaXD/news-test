class Playlist < ApplicationRecord
    belongs_to :user
    has_many :playlist_posts
    has_many :posts, through: :playlist_posts
    # has_and_belongs_to_many :posts
end
