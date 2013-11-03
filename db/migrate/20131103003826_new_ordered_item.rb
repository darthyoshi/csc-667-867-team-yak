class NewOrderedItem < ActiveRecord::Migration
  def change
    drop_table :ordereditems
    create_table :ordereditems do |t|
      t.belongs_to :order
      t.integer :sold_artwork_id
      t.integer :quantity
      t.decimal :price 
      t.string :category
      t.string :title
      t.string :imagepath
      t.text :description
      t.string :seller_name
      t.string :seller_email
      t.timestamps
    end
  end
end
