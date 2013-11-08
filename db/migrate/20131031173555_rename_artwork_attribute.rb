class RenameArtworkAttribute < ActiveRecord::Migration
  def change
    rename_column :artworks, :description, :description
  end
end
