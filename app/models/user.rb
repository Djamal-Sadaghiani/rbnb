class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Relationships
  has_many :parking_spaces
  has_many :cars
  has_many :bookings, through: :cars
  has_many :bookings, through: :parking_spaces

  #Validations

end
end
