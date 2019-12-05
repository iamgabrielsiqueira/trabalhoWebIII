class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:cpf])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_date])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
    private
    
    def user_not_authorized
        redirect_to root_path
    end
    
end
