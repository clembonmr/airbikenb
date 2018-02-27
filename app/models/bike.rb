class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :brand, :category, :daily_price, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  # include PgSearch
  # pg_search_scope :global_search,
  #   against: [ :type, :daily_price ],
  #   associated_against: {
  #     bike: [ :type, :daily_price ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

    # Bike.global_search

  def avaible?
    @bookings = Booking.where(bike_id: self.id)
    @bookings.each do |booking|
      if booking.start_date <= Date.today && booking.end_date >= Date.today
       return false
     else
      true
    end
  end
end

def avaibility
  @bookings = Booking.where(bike_id: self.id)
  @bookings.each do |booking|
    if booking.start_date <= Date.today && booking.end_date >= Date.today
      return (booking.end_date).strftime("%A, %b %d")
    end
  end
  end

def future_bookings
  @bookings = Booking.where(bike_id: self.id)
  @bookings.each do |booking|
    p "The bike has a booking from #{booking.start_date} to #{booking.end_date}"
  end
end

  def average_rate
    sum = 0
    @bookings = Booking.where(bike_id: self.id)
    @bookings.each do |booking|
      sum += booking.review.rate.to_i
    end
     return (sum / (@bookings.size.to_i)).round
  end


end
