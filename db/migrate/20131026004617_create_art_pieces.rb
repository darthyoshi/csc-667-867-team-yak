class CreateArtPieces < ActiveRecord::Migration
  def change
    create_table :art_pieces do |t|
      t.string :category
      t.string :title
      t.float :price
      t.integer :quantity
      t.string :image_path
      t.text :description

      t.timestamps
    end
  end
end
