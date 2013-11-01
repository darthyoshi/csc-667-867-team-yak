class Shopping < ActiveRecord::Migration
  def change
    create_table :shoppingcart do |t|
      t.integer :quantity
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
