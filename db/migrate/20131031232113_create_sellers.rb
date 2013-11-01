class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :displayed_name
      t.text :description
      t.string :seller_email

      t.timestamps
    end
  end
end
