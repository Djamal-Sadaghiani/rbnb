#Seed file for the app

#Users

user = User.new ({
  first_name: "John",
  last_name: "Doe",
  address: "Rails Road",
  city: "Ruby",
  postcode: "420",
  country: "Germany",
  email: "ruby@ruby.com",
  avatar: "https://qph.fs.quoracdn.net/main-qimg-a8cafcc4acb60054c65bd209e7f5cc79-c",
  date_of_birth: Date.today,
  phone_number: "4204204240240240",
  password: "testtest",
  password_confirmation: "testtest"
  })
user.save

user2 = User.new ({
  first_name: "Peter",
  last_name: "Parker",
  address: "Rails Road",
  city: "Ruby",
  postcode: "420",
  country: "Germany",
  email: "peterparker@rails.com",
  avatar: "https://qph.fs.quoracdn.net/main-qimg-a8cafcc4acb60054c65bd209e7f5cc79-c",
  date_of_birth: Date.today,
  phone_number: "4204204240240240",
  password: "testtest",
  password_confirmation: "testtest"
  })
user2.save

puts "-- db:seed => created two users"
#Cars

5.times do
  car = Car.new({
    license: Faker::Dota.hero,
    brand: Faker::Dota.item,
    model: Faker::Dota.player,
    colour: Faker::Color.color_name,
    user: user,
  })
  car.save
end
puts "-- db:seed => created five cars"
#Parking_spaces

50.times do
  space = ParkingSpace.new({
    size: rand(4..12),
    user: user2,
    address: Faker::Address.street_address,
    city: "London",
    postcode: "WC2N 5DU",
    country: "United Kingdom",
    category: "Garage",
    price_per_hour: rand(100..500),
    availability: "somethingishere"
  })
  space.save
end
puts "-- db:seed => created fifty parking spaces"
#Bookings

5. times do
  booking = Booking.new({
    start_time: DateTime.new(2018,2,3,4,5,6),
    end_time: DateTime.new(2018,2,3,6,5,6),
    car_id: rand(1..5),
    parking_space_id: rand(1..5),
    price: rand(10..30),
    status: false
  })
  booking.save
end
puts "-- db:seed => created five parking bookings"
puts "-- db:seed => SUCCESS"
