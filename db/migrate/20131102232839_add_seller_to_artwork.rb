class AddSellerToArtwork < ActiveRecord::Migration
  def change
    add_reference :artworks, :seller, index: true
  end
end
