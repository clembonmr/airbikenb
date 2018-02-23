class Review < ApplicationRecord
  belongs_to :booking
  validates :description, :rate, presence: true
  validates :rate, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }

  def average_rate
    @bike = Bike.find(params(:bike_id))
    Review.average(:rate).where(bike_id: @bike.id)
  end

end
