# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  args_hash = {
  name: Faker::Friends.quote,
  address:  Faker::Address.street_address + ',' + Faker::Address.zip_code + ',' + Faker::Address.city_prefix + Faker::Address.city_suffix + ',' + Faker::Address.state,
  description: Faker::Lorem.paragraph(5),
  price_per_night: rand(60...100),
  number_of_guests: rand(1...6)
  }
  flat = Flat.create(args_hash)
end
