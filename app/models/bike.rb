class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :brand, :category, :daily_price, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?



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


end
