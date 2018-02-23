class AddLocationToBikes < ActiveRecord::Migration[5.1]
  def change
    add_column :bikes, :location, :string
  end
end
