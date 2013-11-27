class Order < ActiveRecord::Base
  # delete all oredereditems when the order is deleted from the database
  has_many :ordereditems, :dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :ordereditems, allow_destroy: true
  
end
