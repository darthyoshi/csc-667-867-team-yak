module ApplicationHelper
  
  def userfullname(user)
    user.firstname + ' ' + user.lastname
  end
  
  def userfullnamebyid(id)
    user = User.find(id)
    user.firstname + ' ' + user.lastname
  end
  
  def showstars(n)
    case n
    when 1
      "*"
    when 2
      "**"
    when 3
      "***"
    when 4
      "****"   
    else 5
      "*****"  
    end  
  end
  
end
