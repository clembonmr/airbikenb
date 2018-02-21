class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :category
      t.text :description
      t.string :photo
      t.integer :daily_price
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.boolean :availability

      t.timestamps
    end
  end
end
