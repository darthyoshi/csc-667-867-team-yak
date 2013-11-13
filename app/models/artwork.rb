class Artwork < ActiveRecord::Base
  
  has_and_belongs_to_many :arttags 
  belongs_to :seller
  #both lines are needed:
  has_many :reviews
  has_many :users, :through => :reviews

  #the following line allows to using Artwork.find(id).reviewers
  has_many  :reviewers, :through => :reviews, :source => :user
  
  #validates :title, :description, :imagepath, :quantity, :price, :category, :seller_id, :presence => true
  #validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  #validates :imagepath, :format => {
  #  :with => %r{\.(git|jpg|png)$}i,
  #  :message => 'must be a URL for gif, jpg or png image.'
  #}
end
