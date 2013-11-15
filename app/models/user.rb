class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  
      
  has_one :seller, :dependent => :destroy
  
  has_many :shoppingcartitems, :dependent => :destroy
  
  has_many :reviews, :dependent => :nullify
  has_many :artworks, :through => :reviews
  
  has_many :orders, :dependent => :nullify
  accepts_nested_attributes_for :orders
  
end
