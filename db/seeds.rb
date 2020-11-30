require "open-uri"

# User.destroy_all
Venue.destroy_all
# Chatroom.destroy_all
# Booking.destroy_all


# puts "creating admin"
# admin = User.new
# admin.email = "admin@email.com"
# admin.password = "pintpal"
# admin.first_name = "admin"
# admin.last_name = "admin"
# admin.date_of_birth = Date.today - 10000
# admin.address = "180 Ashley Gardens, Emery Hill Street, SW1P 1PD"
# admin.save!

ConvertApi.config.api_secret = 'AeeFlFsOwN3UHTzO'
def convert_to_jpg(url)
   return ConvertApi.convert('jpg', { Url: url }, from_format = 'web')
end

venue_array = [
  thecourt = {
    address: "The Court, 108a Tottenham Court Road, London, Greater London, W1T 5AA",
    name: "The Court",
    category: "Pub",
    description: "Large contemporary pub with weekly pub quiz, big screen sports and seasonal menus of real cask ales.",
    photos: ['https://img01.beerintheevening.com/d6/d6d386f22140222bc6c6dfec33126162.jpg',
            'https://img01.beerintheevening.com/9a/9a245f51bf7a15f39bcd35b3b1aefdf5.jpg',
            'https://www.thediningoutgiftcard.co.uk/specific/images/heroes/premises/oak/mc/court.jpg'
    ]
  },
  thephene = {
    address: "9 Phene St, Chelsea, London SW3 5NY",
    name: "The Phene",
    category: "Pub",
    description: "Converted pub with purple-velvet lounge bar, library-themed dining room and beach bar-style terrace.",
    photos: ['https://upload.wikimedia.org/wikipedia/commons/4/41/Phene_Arms_May_2012.JPG',
            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_1400,h_862/https://www.thephene.com/wp-content/uploads/sites/54/2019/06/Garden.jpg',
            'https://www.hot-dinners.com/media/reviews/photos/original/80/48/da/632_phene_128127746499.jpg'
    ]
  },
  edi = {
    address: "204 Ferndale Rd, Ferndale, London SW9 8AG",
    name: "The Duke of Edinburgh",
    category: "Pub",
    description: "Quirky modern pub with feature lighting, purple pool table and an expansive, leafy beer garden.",
    photos: ['https://pbs.twimg.com/media/EcA9gAlWkAI81IO.jpg',
            'https://pbs.twimg.com/media/ElaQMrUXIAA4bhA.jpg',
            'https://proemergencyplumbernearme.co.uk/wp-content/uploads/2018/09/The-Duke-Of-Edinburgh-Brixton.jpg'
    ]
  },
  euston_tap = {
    address: '190 Euston Rd, London NW1 2EF',
    name: 'The Euston Tap',
    category: 'Bar',
    description: 'Dedicated cider bar with cask ales and draught beers, in a Victorian gatehouse with beer garden.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOFjw4usFv_ZBRdwHumS_EDn9ekKb4ivPbqEcZ9=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNyMNnToxqQ2uMn3hjtkWcPSn0t5NC1JYworbRw=s1920-k-no'
    ]
  }
]

# address:
# name:
# category:
# description:
# photos: [
# ]

venue_array.each do | venue |
  puts "generating #{venue[:name]}"
  new_venue = Venue.new
  new_venue.address = venue[:address]
  new_venue.name = venue[:name]
  new_venue.category = venue[:category]
  new_venue.description = venue[:description]
  venue[:photos].each_with_index do | photo, index |
    file = URI.open(photo)
    title = venue[:name].gsub(/\s/, "")
    new_venue.photos.attach(io: file, filename: "#{title}-image-#{index + 1}.jpg", content_type: 'image/jpg')
  end
  new_venue.user = User.first
  new_venue.save
end

