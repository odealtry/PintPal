# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Venue.destroy_all
User.destroy_all
Booking.destroy_all


puts "creating admin"
admin = User.new
admin.email = "admin@email.com"
admin.password = "pintpal"
admin.first_name = "admin"
admin.last_name = "admin"
admin.date_of_birth = Date.today - 10000
admin.address = "180 Ashley Gardens, Emery Hill Street, SW1P 1PD"
admin.save!

puts "creating venue 1"
thecourt = Venue.new
thecourt.address = "The Court, 108a Tottenham Court Road, London, Greater London, W1T 5AA"
thecourt.name = "The Court"
thecourt.user = admin
thecourt.category = "Pub"
thecourt.save!

puts "creating venue 2"
thephene = Venue.new
thephene.address = "9 Phene St, Chelsea, London SW3 5NY"
thephene.name = "The Phene"
thephene.user = admin
thephene.category = "Pub"
thephene.save!

puts "creating venue 3"
edi = Venue.new
edi.address = "204 Ferndale Rd, Ferndale, London SW9 8AG"
edi.name = "The Duke of Edinburgh"
edi.user = admin
edi.category = "Pub"
edi.save!
