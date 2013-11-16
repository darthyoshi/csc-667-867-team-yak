class Shoppingcartitem < ActiveRecord::Base
  belongs_to :user
  belongs_to :artwork
  
  def self.users_items(uid)
    where(user_id: uid)
  end 
end
