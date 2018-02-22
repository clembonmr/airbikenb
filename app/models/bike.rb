class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  validates :brand, :category, :photo, :daily_price, presence: true
end
