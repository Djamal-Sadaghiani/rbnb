class ParkingSpace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :size, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :type, presence: true, , inclusion: { in: ["covered, on road, off road"]}
  validates :price_per_hour, presence: true
  validates :user, presence: true
end
