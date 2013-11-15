class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :shipping_address, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
