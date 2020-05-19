class Post < ApplicationRecord
    has_one_attached :mp3
    belongs_to :article
    belongs_to :user

    # has_many :playlist_posts
    # has_many :playlists, through: :playlist_posts

    def self.search(query)
        if query
            where(["LOWER(title) LIKE LOWER(?)", "%#{query}%"])
        else
            all
        end
    end
end
