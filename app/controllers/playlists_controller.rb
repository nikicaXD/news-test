class PlaylistsController < InheritedResources::Base

  private

    def playlist_params
      params.require(:playlist).permit(:title, :user_id)
    end

end
