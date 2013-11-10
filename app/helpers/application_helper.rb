module ApplicationHelper
  
  def userfullname(user)
    user.firstname + ' ' + user.lastname
  end
  
end
