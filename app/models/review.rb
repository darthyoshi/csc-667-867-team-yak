class Review < ActiveRecord::Base
  #validates :review_text, length: { maximum: 1000,
  #too_long: "%{count} characters is the maximum allowed" }
      
  belongs_to :user
  belongs_to :artwork
  
end
