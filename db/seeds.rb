# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
Booking.destroy_all
Venue.destroy_all
User.destroy_all




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
thecourt.description = "Large contemporary pub with weekly pub quiz, big screen sports and seasonal menus of real cask ales."
thecourt.save!
file = URI.open('https://img01.beerintheevening.com/d6/d6d386f22140222bc6c6dfec33126162.jpg')
thecourt.photos.attach(io: file, filename: 'image-4.jpg', content_type: 'image/jpg')
file = URI.open('https://img01.beerintheevening.com/9a/9a245f51bf7a15f39bcd35b3b1aefdf5.jpg')
thecourt.photos.attach(io: file, filename: 'image-5.jpg', content_type: 'image/jpg')
file = URI.open('https://www.thediningoutgiftcard.co.uk/specific/images/heroes/premises/oak/mc/court.jpg')
thecourt.photos.attach(io: file, filename: 'image-6.jpg', content_type: 'image/jpg')



puts "creating venue 2"
thephene = Venue.new
thephene.address = "9 Phene St, Chelsea, London SW3 5NY"
thephene.name = "The Phene"
thephene.user = admin
thephene.category = "Pub"
thephene.description = "Converted pub with purple-velvet lounge bar, library-themed dining room and beach bar-style terrace."
thephene.save!
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/4/41/Phene_Arms_May_2012.JPG')
thephene.photos.attach(io: file, filename: 'image-1.jpg', content_type: 'image/jpg')
file = URI.open('https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_1400,h_862/https://www.thephene.com/wp-content/uploads/sites/54/2019/06/Garden.jpg')
thephene.photos.attach(io: file, filename: 'image-2.jpg', content_type: 'image/jpg')
file = URI.open('https://www.hot-dinners.com/media/reviews/photos/original/80/48/da/632_phene_128127746499.jpg')
thephene.photos.attach(io: file, filename: 'image-3.jpg', content_type: 'image/jpg')

puts "creating venue 3"
edi = Venue.new
edi.address = "204 Ferndale Rd, Ferndale, London SW9 8AG"
edi.name = "The Duke of Edinburgh"
edi.user = admin
edi.category = "Pub"
edi.description = "Quirky modern pub with feature lighting, purple pool table and an expansive, leafy beer garden."
edi.save!
file = URI.open('https://pbs.twimg.com/media/EcA9gAlWkAI81IO.jpg')
edi.photos.attach(io: file, filename: 'image-7', content_type: 'image/jpg')
file = URI.open('https://pbs.twimg.com/media/ElaQMrUXIAA4bhA.jpg')
edi.photos.attach(io: file, filename: 'image-8', content_type: 'image/jpg')
file = URI.open('https://proemergencyplumbernearme.co.uk/wp-content/uploads/2018/09/The-Duke-Of-Edinburgh-Brixton.jpg')
edi.photos.attach(io: file, filename: 'image-9', content_type: 'image/jpg')






