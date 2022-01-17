class RegistrationsController < Devise::RegistrationsController
  layout 'application', only: [:edit, :update]
  before_action :config_permitted_parameters

  
  protected
  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, avatar_attributes: [:pictureable_id, :pictureable_type, :picture_url]])
  end
  
  def update_resource(resource, params)
    if params[:current_password].blank?
      if params[:avatar_attributes][:picture_url].blank?
        resource.update_without_password(params.except(:current_password, :avatar_attributes))
      else
        resource.update_without_password(params.except(:current_password))
      end
    else
      if params[:avatar_attribues][:picture_url].blank?
        resource.update_with_password(params.except(:avatar_attributes))
      else
        resource.update_with_password(params)
      end
    end
  end

end