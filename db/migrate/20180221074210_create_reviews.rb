class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.float :rate
      t.references :bike, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
