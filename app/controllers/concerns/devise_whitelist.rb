module DeviseWhitelist
  # Note to self - This is a good lesson on module naming:
  # The module naming conention HAS to match the module filename
  # This is why in the past i've always had problems including
  # Modules in testing

  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:name] )
    end
  end
end
