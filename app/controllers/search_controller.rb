class SearchController < ApplicationController

  before_action :authenticate_user!

    def index
        # @articles = Article.all
        # @posts = Post.all
        # @genres = Genre.all
        # @artists = User.where(user_type: 1)

        @articles = Article.search(params[:search]).sort_by {|u| u.id}.reverse
        # @articles = Article.search(1)
        @posts = Post.search(params[:search]).sort_by {|u| u.id}.reverse
        @artists = User.search(params[:search]).sort_by {|u| u.id}.reverse
      end
      
end
