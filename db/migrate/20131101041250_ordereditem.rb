class Ordereditem < ActiveRecord::Migration
  def change
    create_table :ordereditems do |t|
          t.belongs_to :artwork
          t.belongs_to :order
          t.integer :quantity
          t.decimal :price 
          
          t.timestamps
        end
  end
end
