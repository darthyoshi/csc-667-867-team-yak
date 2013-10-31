class ScalingMoney < ActiveRecord::Migration
  def change
    change_column :artworks, :price, :decimal, precision: 7, scale: 2
  end
end
