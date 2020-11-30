require "open-uri"

Review.destroy_all
Message.destroy_all
Booking.destroy_all
Chatroom.destroy_all
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
  },
  the_prince = {
    address: "14 Lillie Rd, Hammersmith, London SW6 1TT, United Kingdom",
    name: "The Prince",
    category: "Pub",
    description: "Group of 4 restaurants with garden seating, serving comfort food, Italian dishes, pizza & burgers.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPxQxADU8V1nHO2ChvWHDUlIc1bc89aZegcaN-G=s1920-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipOez32o5Yvv-bxpicsXX-f8iUIOsh8P6DO0_wmA=s1920-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipMejLZcVT1YVPky6GlwIs_grr7HZ000YZYAUPot=s1920-k-no'
    ]
  },
  the_lamb = {
    address: '9 Barley Mow Passage, Chiswick, London W4 4PH',
    name: 'The Lamb',
    description: 'Smart modern take on a traditional pub, serving seasonal British dishes inside or on leafy terrace.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipMH9WMZk0ecWARThRfNwp49T8PFdJDLil-cANrV=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipPdhIYnpXoQpxlpcz0_Lv7bDR3qjkd_Bml8vTX-=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipNOGRyS5V2nsrjp8e4SlNwXuRUE-Q9Y5PWaYBiC=w512-h480-p-k-no-pi-10-ya256.59515-ro0-fo100'
    ]
  },
  the_george = {
    address: '185 Chiswick High Rd, Chiswick, London W4 2DR',
    name: 'The George IV',
    description: 'Classic pub with heavily wooded decor and original etched glass, as well as a large modern garden.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipM-5BiCyJZtNzs_DWzQa0wUHF0SgDLHo_5jOgCW=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipPhxl16tsmpJON99O1eV5adbhKYldOOMcF2wN7Y=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipN8sh9ADoytxY1aKO7XvAko8016AOhyswam-ogR=w512-h480-p-k-no'
    ]
  },
  the_duke = {
    address: '75 S Parade, London W4 5LF',
    name: 'The Duke of Sussex',
    description: 'Grand, Victorian pub with chandeliers, central skylight and garden.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipPFSEG74SbxEYAX5t5o_Sjfc2xrnLMM2jyq1jD8=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipOcnM6bXZ7Z847swaqCLQTMFPw0WsCNIqe_8AC7=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipO-cH2upy9VybzZ3AGGrHHSCXQq6DObcnQsvkDw=w512-h480-p-k-no'
    ]
  },
  high_road = {
    address: '162-170 Chiswick High Rd, Chiswick, London W4 1PR',
    name: 'High Road House',
    description: 'Occupying a Georgian townhouse, this stylish hotel and members club is a 4-minute walk from Turnham Green tube station, and 5 miles from Buckingham Palace.',
    category: 'Restaurant',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipNG4GSDXZ7-iwC93241qT7DUkmo4g7ytil_WY_X=w512-h480-p-k-no'
    ]
  },
  the_carpenter = {
    address: '91 Black Lion Ln, Hammersmith, London W6 9BG',
    name: 'The Carpenter\'s Arms',
    description: 'Regularly changing gastropub menu in a characterful room with black and white tiles round the bar.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipOf_5y4huEiKWzslitJnIaUOd22emxT-DwKJCG2=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipNlz-ZD3Zh9v8Jzb1PnnaSezSg-IBaIwwUVMoTT=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipMgJ6ARVPtMjNbMEXjbPDdbMQrQd32AHyAaFuAw=w512-h480-p-k-no'
    ]
  },
  the_queens = {
    address: '13 Brook Green, Hammersmith, London W6 7BL',
    name: 'The Queen\'s Head',
    description: 'Wood-beamed pub with fireplace and a leafy garden, serving traditional Sunday roast dinners.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipMQzm6Oz3na-8vNJld_z9uMg_YGQc0HHVuswd4v=w512-h480-p-k-no-pi0-ya205.6963-ro0-fo100',
      'https://lh5.googleusercontent.com/p/AF1QipPI-jCq2GmP9qM0nXsulz5mWOnJh3OuRAzO7Xd7=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipOXg842GV4YqMpOshqkMRiunte6nBtWZBToaNCJ=w512-h480-p-k-no'
    ]
  },
  the_admiral = {
    address: '17 Mossop St, Chelsea, London SW3 2LY',
    name: 'The Admiral Codrington',
    description: 'Gastropub with chunky tables in saloon and a modern dining area with retractable glass roof.',
    category: 'Restaurant',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipM21EMxed9B9cFDLRwTq8XTOe3CY7-WjCIjSkPT=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipPnwx_sGKwJzS4j8VccNiKWf40kCmPtSZbaTmps=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipOlXen3GC7aTUkJUYURY-e_NVQOP11LAKwbhl5L=w512-h480-p-k-no'
    ]
  },
  the_oak = {
    address: '35 Wingate Rd, Hammersmith, London W6 0UR',
    name: 'The Oak W12',
    description: 'Italian-Mediterranean fare in a trendy Victorian gastropub with antique and rustic-style furnishing.',
    category: 'Restaurant',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipMs9ayuFRSayaS2AxfBltEnaOtVkF638cyVMyw=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipNRB_0ANFEBzFsZtm9eT-4jN3t80Adf3JQHCn0=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipPXQrgag7kJZ1BAPd8MZARloM75U-AsAEySKRg=w512-h480-p-k-no-pi-10-ya240-ro0-fo100'
    ]
  },
  the_duchess = {
    address: '320 Goldhawk Rd, London W6 0XF',
    name: 'The Duchess W6',
    description: 'Comedy, spoken word, live music and big-screen sport at traditional pub serving pints and pub grub.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipM_rmteeipdpiLRyjHVZ7WDRmOimGiVjCrFnuk1=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipNvnUn9yIsSn6HVdaL3iG4UDFisH9GIbjuIieQH=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipM0XnhZMlFG-bWPOxqET01jEHCW2nzAg-2uQEb5=w512-h480-p-k-no'
    ]
  },
  the_eagle = {
    address: '215 Askew Rd, Shepherd\'s Bush, London W12 9AZ',
    name: 'The Eagle',
    description: 'British gastropub with bright fabrics and a living room feel, deckchairs and beanbags in the garden.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipPaGxoQuz2NOYuIsKKqsUFLu16hCDXTq-Nxr6T2=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipOI7LzwTSOQvvZ5szLmfAyhqtR8qKN0zE04Qbcq=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipPMT4PpHj1Xu0a38DgM0YCRUicBCraokACzHt7a=w512-h480-p-k-no'
    ]
  },
  express_tavern = {
    address: '56 Kew Bridge Rd, Brentford TW8 0EW',
    name: 'Express Tavern',
    description: 'Refined, traditional pub with carved bar and leafy beer garden, for cask ales and comfort food menu.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipNJc8mkTs7crBEE3Y3ujOhyRCJM1UzsX2mQHXpM=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipM-vlX_qmzCDOXwtWVlfZoACV8PZhy6zSSL04KV=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipNWAIvwBC1cRlM4yjJcZSDftngnMs7drZ9gaY3b=w512-h480-p-k-no'
    ]
  },
  the_windsor = {
    address: '114 Campden Hill Rd, Kensington, London W8 7AR',
    name: 'The Windsor Castle',
    description: 'Refurbished old boozer with wood-panelled walls, a beer garden plus real ale and seasonal food menu.',
    category: 'Pub',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipOlzvC_R49CXUmAavNsE2RF8pQCq5ltW3HdK3sM=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipNeJE-eCbCya2-qjG2RSYDRz-WZwmJdWObO8-WV=w512-h480-p-k-no',
      'https://lh5.googleusercontent.com/p/AF1QipOJy5YEp2QkChbG5MEIeDTqP2V7sdUGPBAemMhm=w512-h480-p-k-no'
    ]
  }
]

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
  new_venue.save!
end

