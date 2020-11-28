class ApplicationController < ActionController::Base


    protect_from_forgery with: :exception

    before_action :configure_permitted_params, if: :devise_controller?

    private

    def configure_permitted_params
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :avatar, :email, :password) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :avatar, :email, :password, :current_password) }
    end
end
