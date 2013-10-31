class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :category
      t.string :title
      t.decimal :price
      t.integer :quantity
      t.string :imagepath
      t.text :destription

      t.timestamps
    end
  end
end
