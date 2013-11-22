class Seller < ActiveRecord::Base
  
  validates_presence_of :displayed_name
  validates_presence_of :seller_description
  validates_presence_of :seller_email
  
  validates_uniqueness_of :user_id
  validates_uniqueness_of :seller_email
  validates_length_of :seller_email, :within => 5..50
  validates_format_of :seller_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  belongs_to :user
  has_many :artworks, :dependent => :nullify
  

  
end
