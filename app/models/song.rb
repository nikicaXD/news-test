class Song < ApplicationRecord
    has_one_attached :mp3
    belongs_to :album
    belongs_to :user

    # has_many :playlist_songs
    # has_many :playlists, through: :playlist_songs

    def self.search(query)
        if query
            where(["LOWER(title) LIKE LOWER(?)", "%#{query}%"])
        else
            all
        end
    end
end
