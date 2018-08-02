class Booking < ApplicationRecord
  belongs_to :parking_space
  belongs_to :car
  validates :parking_space, :car, :start_time, :end_time, :price, :status, presence: true

  enum status: [:unconfirmed, :confirmed, :rejected, :cancelled]
end
