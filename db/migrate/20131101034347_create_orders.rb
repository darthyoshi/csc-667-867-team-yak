class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.datetime :order_date
      t.text :shipping_address
      t.decimal :shipping_cost

      t.timestamps
    end
  end
end
