class AdminController < ApplicationController
  
  def index
    # we need this controller because we have admin menu
  end
  
  def listusers
    @users = User.all
  end
  
end
