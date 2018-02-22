class ChangeAvailabilityToBikes < ActiveRecord::Migration[5.1]
  def change
    change_column :bikes, :availability, :boolean, :default => true
  end
end
