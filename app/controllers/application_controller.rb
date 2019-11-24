class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
      # devise_parameter_sanitizer.permit(:sign_in,) { |u| u.permit(:username, :password, :password_confirmation) }
    end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end