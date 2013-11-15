class BigSchema < ActiveRecord::Migration
  def change
    
    create_table :sellers do |t|
      t.integer  :user_id
      t.datetime :seller_date
      t.string   :displayed_name
      t.text     :seller_description
      t.string   :seller_email
      t.timestamps
    end  
    
    create_table :arttags do |t|
      t.string   :tagname
      t.timestamps
    end

    create_table :artworks do |t|
      t.integer  :seller_id
      t.string   :category
      t.string   :title
      t.decimal  :price,       precision: 7, scale: 2
      t.integer  :quantity
      t.string   :imagepath
      t.text     :description
      t.timestamps
    end

    create_table :taggings do |t|
      t.integer :artwork_id
      t.integer :arttag_id
      t.timestamps
    end

    create_table :orders do |t|
      t.integer  :user_id
      t.datetime :order_date
      t.decimal  :shipping_cost
      t.timestamps
    end
    
    create_table :ordereditems do |t|
      t.integer  :order_id
      t.integer  :sold_artwork_id
      t.string   :category
      t.string   :title
      t.decimal  :price,       precision: 7, scale: 2
      t.integer  :quantity
      t.string   :imagepath
      t.text     :description
      t.string   :seller_name      
      t.string   :seller_email
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer  :user_id
      t.integer  :artwork_id
      t.integer  :stars  
      t.text     :review_text
      t.datetime :review_date
      t.timestamps
    end


    create_table :shoppingcartitems do |t|
      t.integer  :user_id
      t.integer  :artwork_id
      t.integer  :quantity
      t.timestamps
    end

  end
end
