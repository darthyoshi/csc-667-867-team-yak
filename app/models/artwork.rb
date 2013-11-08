class Artwork < ActiveRecord::Base
  # Rails4 uses Strong Parameters,
  # protecting attributes is now done in the Controller
  # No need to set attr_accessible in the model anymore.
  
  has_and_belongs_to_many :arttags 
  belongs_to :seller
  
  default_scope :order => 'title'
end
