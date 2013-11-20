class Admin::MenuController < Admin::BaseController
  
  def index
    # we need this controller because we have admin menu
  end
  
  def listusers
    @users = User.all.order("id DESC")
  end
  
end
