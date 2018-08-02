class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Relationships
  has_many :parking_spaces
  has_many :cars
  has_many :space_bookings, through: :parking_spaces, source: :bookings
  has_many :car_bookings, through: :cars, source: :bookings

  #Validations
  validates :first_name, :last_name, :address, :city, :postcode, :country, :date_of_birth, :phone_number, presence: true
end
