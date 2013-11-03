class Order < ActiveRecord::Base
  has_many :orderitems
  belongs_to :users
end
