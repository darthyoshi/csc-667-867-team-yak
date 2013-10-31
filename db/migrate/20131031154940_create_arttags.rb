class CreateArttags < ActiveRecord::Migration
  def change
    create_table :arttags do |t|
      t.string :tagname

      t.timestamps
    end
  end
end
