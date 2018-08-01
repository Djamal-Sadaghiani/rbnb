class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :license , uniqueness: true
  validates :user, :license, :brand, :model, presence: true
end
