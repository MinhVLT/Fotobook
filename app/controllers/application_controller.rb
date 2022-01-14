class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, avatar_attributes: [:pictureable_id, :pictureable_type, :picture_url]])
    devise_parameter_sanitizer.permit(:account_update, keys: [avatar_attributes: [:pictureable_id, :pictureable_type, :picture_url], user: [:first_name, :last_name]])
  end
end
