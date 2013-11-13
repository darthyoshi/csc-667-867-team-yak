class Changereviewstable < ActiveRecord::Migration
  def change
    rename_column :reviews, :seller_id, :artwork_id
  end
end
