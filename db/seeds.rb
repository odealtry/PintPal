# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Venue.destroy_all
User.destroy_all

beth = User.create!(first_name: 'Bethany', last_name: 'Armstrong', date_of_birth: '19950213', address: 'London', email: 'beth@email.com', password: 'password')



10.times do
  venue = Venue.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: 'Pub',
    user: beth
  )
  venue.save!
end
