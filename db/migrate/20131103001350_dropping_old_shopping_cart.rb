class DroppingOldShoppingCart < ActiveRecord::Migration
  def change
    drop_table :shoppingcart
  end
end
