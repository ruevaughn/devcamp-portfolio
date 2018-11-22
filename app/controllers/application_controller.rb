class ApplicationController < ActionController::Base

  # Leaving here because I haven't done this before / in application_controller before.
  # before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseWhitelist

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name] )
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name] )
  # end

end
