class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:firstname, :lastname, :admin) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :shipping_address, :admin) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :shipping_address, :admin) }  
  end
  

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end  
  
  def valid_for_authentication?
    result = super
    self.deleted_at.present? ? false : result
  end
  
end
