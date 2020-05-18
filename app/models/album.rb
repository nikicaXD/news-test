class Album < ApplicationRecord
    has_one_attached :cover
    has_many :songs
    belongs_to :user
    belongs_to :genre
    
    def self.search(query)
        if query
            where(["LOWER(title) LIKE LOWER(?)", "%#{query}%"])
        else
            all
        end
    end
end
