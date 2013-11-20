class Admin::BaseController < ApplicationController
  
  before_filter :admin_required

   protected

  def admin_required
    
    # if user is not admin redirect to main page  
    unless current_user.try(:admin?)
      flash[:error] = "Admin login required"
      
      # ONE OF THESE SHOULD WORK:
      
      #redirect_to new_login_url
      raise ActionController::RoutingError.new('Not Found')
      render :text => 'Not Found', :status => '404'
    end
  end
  
end
