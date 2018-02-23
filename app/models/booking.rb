class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date?
  validate :date_future
  validate :check_avaibility


  def check_avaibility
    @bookings = Booking.where(bike_id: self.bike_id)
    @bookings.each do |booking|
      if (start_date >= booking.start_date && start_date <= booking.end_date) ||
        (end_date <= booking.end_date && end_date >= start_date)
        errors.add :start_date, "There is a booking for this days!"
      end
    end
  end

  def date_future
    if start_date < Date.today
      errors.add :start_date, "Start Date Must be in the future!"
    end
  end

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

end
