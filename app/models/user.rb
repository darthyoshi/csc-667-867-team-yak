class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me
  has_one :seller
  has_many :shoppingcartitems
  has_many :reviews
  
  #we want to allow one user to write review for many sellers
  has_many :sellers, :through => :reviews
  
  has_many :orders
end
