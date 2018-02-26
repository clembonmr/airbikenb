class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bikes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def owner?
    @bikes = Bike.where(user_id: self.id)
    if @bikes.blank?
      return false
    else
      return true
    end
  end

  def my_rentals
    @bookings = Booking.all
    @result = []
    @bookings.each do |booking|
      @bike = Bike.find(booking.bike_id)
      if @bike.user_id == self.id
        @result << booking
      end
    end
    return @result
  end

  #def my_bikes
   # @bikes = Bike.where(user_id: self.id)
  # end

end
