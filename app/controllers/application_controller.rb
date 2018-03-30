class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

	def after_sign_in_path_for(resource)
    UserLogin.create(user_id: resource.id, latitude: request.location.latitude, longitude: request.location.longitude)
    super
  end

  protected

	  def configure_permitted_parameters
	    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	  end
  
end
