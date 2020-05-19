class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @latestArticles = Article.all.last(5)
        @latestArtists = User.where({ isAdmin: 0 }).last(5)
    end

    
end
