class RegistrationsController < Devise::RegistrationsController
  layout 'application', only: [:edit, :update]
  before_action :config_permitted_parameters


  
  protected
  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, avatar_attributes: [:pictureable_id, :pictureable_type, :picture_url]])
  end
  
  def update_resource(resource, params)
    if params[:current_password].blank?
      resource.update_without_password(params.except(:current_password))
      # byebug
    else
      resource.update_with_password(params)
    end
  end

end