class Car < ApplicationRecord
  belongs_to :user
  validates :license , uniqueness: true
  validates :user, :license, :brand, :model, presence: true
end
