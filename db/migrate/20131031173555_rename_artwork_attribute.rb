class RenameArtworkAttribute < ActiveRecord::Migration
  def change
    rename_column :artworks, :destription, :description
  end
end
