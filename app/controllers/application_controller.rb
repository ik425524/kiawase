class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def after_inactive_sign_up_path_for(resource)
    post_path(resource)
  end

  def after_sign_in_path_for(resources)
    post_path(resource)
  end
end
