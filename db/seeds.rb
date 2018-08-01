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
  nationality: "German",
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
  nationality: "German",
  phone_number: "4204204240240240",
  password: "testtest",
  password_confirmation: "testtest"
  })
user2.save

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

#Parking_spaces

5.times do
  space = ParkingSpace.new({
    size: rand(4..12),
    user: user2,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    postcode: Faker::Address.postcode,
    country: Faker::Address.country,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    category: "Garage",
    price_per_hour: rand(100..500),
    availability: "somethingishere"
  })
  space.save
end
