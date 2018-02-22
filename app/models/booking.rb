class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :start_date, :end_date, presence: true
  validates :start_date_cannot_be_in_the_past, on: :create
  # validates :end_date_must_be_after_today


def start_date_cannot_be_in_the_past
  if start_date < Date.today
    errors.add(:start_date, "can't be in the past")
  end
end

def end_date_must_be_after_today
  if end_date < Date.today
    errors.add(:end_date, "must be latert than today")
  end
end


end
