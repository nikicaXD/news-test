class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def authenticate_artist
            # authenticate_user!
            # redirect_to :root, status: :forbidden unless current_user.user_type == 1
        end

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(keys: [:search])
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :isAdmin, :avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :isAdmin, :avatar])
        end
end
