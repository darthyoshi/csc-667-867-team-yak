class Artwork < ActiveRecord::Base
  # Rails4 uses Strong Parameters,
  # protecting attributes is now done in the Controller
  # No need to set attr_accessible in the model anymore.
  
  has_and_belongs_to_many :arttags 
  belongs_to :seller
  
  #validates :title, :description, :imagepath, :quantity, :price, :category, :seller_id, :presence => true
  #validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  #validates :imagepath, :format => {
  #  :with => %r{\.(git|jpg|png)$}i,
  #  :message => 'must be a URL for gif, jpg or png image.'
  #}
end
