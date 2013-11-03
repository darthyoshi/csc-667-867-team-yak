class CreateShoppingcartitems < ActiveRecord::Migration
  def change
    create_table :shoppingcartitems do |t|
      t.integer :quantity
      t.belongs_to :user
      t.references :artwork
      t.timestamps
    end
  end
end
