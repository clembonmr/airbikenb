class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  validates :brand, :category, :daily_price, presence: true
  mount_uploader :photo, PhotoUploader
end
