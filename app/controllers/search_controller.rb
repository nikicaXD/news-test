class SearchController < ApplicationController

  before_action :authenticate_user!

    def index
        # @albums = Album.all
        # @songs = Song.all
        # @genres = Genre.all
        # @artists = User.where(user_type: 1)

        @albums = Album.search(params[:search]).sort_by {|u| u.id}.reverse
        # @albums = Album.search(1)
        @songs = Song.search(params[:search]).sort_by {|u| u.id}.reverse
        @artists = User.search(params[:search]).sort_by {|u| u.id}.reverse
      end
      
end
