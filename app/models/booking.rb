class Booking < ApplicationRecord
  belongs_to :parking_space
  belongs_to :car
  validates :parking_space, :car, :start_time, :end_time, :status, presence: true
  after_validation :calculate_price

  enum status: [:unconfirmed, :confirmed, :rejected, :cancelled]

  def calculate_price
    parkinng_space = ParkingSpace.find(parking_space_id)
    if end_time && start_time
      price = ((end_time - start_time) / 3600) * parking_space.price_per_hour
      self.price = price
    end
  end
end
