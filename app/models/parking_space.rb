class ParkingSpace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :size, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :category, presence: true
  validates :price_per_hour, presence: true
  validates :user, presence: true
  geocoded_by :geocodedata
  after_validation :geocode

  def geocodedata
    "#{address}, #{postcode} #{city}, #{country}"
  end

end
