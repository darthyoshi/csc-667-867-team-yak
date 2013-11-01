class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.references :user
      t.references :seller
      t.text :review_text

      t.timestamps
    end
  end
end
