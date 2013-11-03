class Shoppingcartitem < ActiveRecord::Base
  belongs_to :user
  has_one :artwork
end
