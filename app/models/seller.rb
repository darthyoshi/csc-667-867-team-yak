class Seller < ActiveRecord::Base
  has_one :user
  has_many :artworks
  has_many :reviews
  has_many :users, :through => :reviews

end
