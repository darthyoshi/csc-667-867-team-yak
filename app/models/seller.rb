class Seller < ActiveRecord::Base
  belongs_to :user
  has_many :artworks
  has_many :reviews
end
