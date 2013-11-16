class Ordereditem < ActiveRecord::Base
  belongs_to :order
  
  def before_save(id)
    Artwork.find(id).decrement
  end
  
end
