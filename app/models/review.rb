class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :seller
end
