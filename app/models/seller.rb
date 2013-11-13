class Seller < ActiveRecord::Base
  belongs_to :user
  has_many :artworks
end
