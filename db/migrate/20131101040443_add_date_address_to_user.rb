class AddDateAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :shipping_address, :string
    add_column :users, :date_joined, :datetime
    add_column :reviews, :review_date, :datetime
    add_column :sellers, :seller_date, :datetime
  end
end
