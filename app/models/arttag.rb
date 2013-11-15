class Arttag < ActiveRecord::Base
  has_many :taggings
  has_many :artworks, :through => :taggings
end
