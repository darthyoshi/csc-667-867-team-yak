class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :seller
  
  has_many :shoppingcartitems, :dependent => :destroy
  #accepts_nested_attributes_for :shoppingcartitems, :allow_destroy => true
  
  has_many :reviews
  has_many :artworks, :through => :reviews
  
  has_many :orders
  accepts_nested_attributes_for :orders
end
