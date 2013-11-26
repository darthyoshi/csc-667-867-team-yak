class Shoppingcartitem < ActiveRecord::Base
  belongs_to :user
  belongs_to :artwork
  
  def self.users_items(uid)
    where(user_id: uid)
  end 
  
  def self.cart_count(uid)
    #SELECT COUNT(*) FROM shoppingcartitems WHERE user_id = 2;
    users_items(uid).count
  end
  
end
