class ReplacingSellers < ActiveRecord::Migration
  def change
    drop_table :sellers
    create_table :sellers do |t|
      t.belongs_to :user
      t.datetime :seller_date 
      t.string :displayed_name 
      t.text :seller_description
      t.string :seller_email
    end
  end
end
