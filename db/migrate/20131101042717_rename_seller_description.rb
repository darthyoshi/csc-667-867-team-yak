class RenameSellerDescription < ActiveRecord::Migration
  def change
    rename_column :sellers, :description, :seller_description
  end
end
