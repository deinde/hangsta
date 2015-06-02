class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :avatar
  end

  def after_sign_in_path_for(resource_or_scope)
		'/welcome/index'	
  end										#this is required after redirect the root page to devise/sessions#new. It prevents infinite loop url.

  

end
