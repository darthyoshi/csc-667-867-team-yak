class AddAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_address, :string
  end
end
