class ArttagArtworkJoin < ActiveRecord::Migration
  def change
    create_table :arttags_artworks, :id => false do |t|
      t.belongs_to :artwork
      t.belongs_to :arttag
    end
  end
end
