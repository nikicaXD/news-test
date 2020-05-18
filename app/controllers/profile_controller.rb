class ProfileController < ApplicationController
    before_action :authenticate_user!

    def show
        # @user = User.find(params[:id])
        set_user
        
        # @relationship = RelationShip.find({follower_id: current_user, followed_id: @user})
        # @relationship = RelationShip.all
    end

    def follow
        @user = User.find(params[:id])
        current_user.follow(@user)
        # redirect_to "/artist/#{@user.id}"
        redirect_back(fallback_location: root_path)
    end

    def unfollow
        @user = User.find(params[:id])
        current_user.stop_following(@user)
        # redirect_to "/artist/#{@user.id}"
        redirect_back(fallback_location: root_path)
    end

    def following
        @following = current_user.all_following
    end

    private
        def set_user
            @user = User.find(params[:id])
        end
end
