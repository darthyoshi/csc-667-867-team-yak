class Order < ActiveRecord::Base
  has_many :ordereditems
  belongs_to :user
end
