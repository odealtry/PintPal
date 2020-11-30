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
  # CENTRAL
  dalla_terra =  {
    address: '25 Slingsby Place The Yards, London WC2E 9AB',
    name: 'Dalla Terra Wine Bar & Restaurant',
    category: 'Bar',
    description: 'Contemporary enoteca for regional wines and small-plate dishes, takeaway bottles and deli produce.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipP1vbUF8omTSpvg18u9EWtvAhk-nUtCCMnz7SjJ=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipOEWQ29_Og7ptD7IPrek36vfhemA47SrHDVADsi=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipNUPlNTFC6CQ2I4Af1AnqmaW4iX_S99_PWWtsuF=s1920-k-no'
    ]
  },

  garlic_shots =  {
    address: '14 Frith St, Soho, London W1D 4RD',
    name: 'Garlic & Shots',
    category: 'Bar',
    description: 'Low-lit, gothic-style bar with 101 flavoured vodkas and cantina-style food, all with lots of garlic.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPQ3uhioS09_EgqrV3fiyyFGzoDNxNCU-PDGSE=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMB6EgIJgsc-DNU1im65wSu43l66MGin5bddyCR=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMrzeldUQnHW60Ak9E0-t-zEBRDV9W1gX-1Svbd=s1920-k-no'
    ]
  },
  
  german_gym =  {
    address: 'King\'s Blvd, Kings Cross, London N1C 4BU',
    name: 'German Gymnasium Grand Café',
    category: 'Restaurant',
    description: 'Historic former gym turned into a modern, all day Grand Café and bar serving Mittel-European cuisine',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNYwhxRVnQg7QUp86LC6oTCcwXMmbsZQyWNxYPz=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMdeeOLJBxSnf2S2DTy3pe_gE46-vix_FinkKmM=s1920-k-no'
    ]
  },

  remedy_bar =  {
    address: '124 Cleveland St, Fitzrovia, London W1T 6PG',
    name: 'The Remedy Wine Bar Shop & Kitchen',
    category: 'Bar',
    description: 'Cosy and relaxed place with beautiful wine in the style of a Continental enoteca.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNJxMuv88s8UsxXln0PaC0kD28g_5lBiop5LZoE=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipPW5lmZ7oZo8WKPvVdujpBQojv58v841FcjJp1q=s1920-k-no-pi-20-ya120-ro0-fo100',
              'https://lh5.googleusercontent.com/p/AF1QipNP3Q9I5Pv3q9NXM-RQbc1msJUlS0tM81xPRWFc=s1920-k-no'
    ]
  },

  camino_kx =  {
    address: 'The Regent Quarter 3 Varnishers Yard, London N1 9FD',
    name: 'Camino King\'s Cross',
    category: 'Bar',
    description: 'Tapas, platters, brunches and Spanish wines in an informal brick and wood space, with terrace.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMD5GcDuPQMFMnWEzdnbHdMbiH1m4kMu0nMfj_j=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipOItpPH4by1h4IUV4rqO4vNOkK3CM8Nn7xhm7Lx=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMMBzjO4wsE7qUEtVpNnw13wsZ7NSGBBvH8bWVk=s1920-k-no'
    ]
  },

  gordons_embankment =  {
    address: '47 Villiers St, Charing Cross, London WC2N 6NE',
    name: 'Gordon\'s Wine Bar',
    category: 'Bar',
    description: '19th-century wine bar in candlelit, vaulted cellars with original Dickensian-style decor.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPdn7PpdVS97Z0g3WZxIpTDs75hd9L9gXEAa1Q-=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipMY97i16VyDLfMTPKocD4GvL8GzIwl4j17Yo_UI=s1920-k-no'
    ]
  },

  j_sheekey =  {
    address: '28-32 St Martin\'s Ct, Covent Garden, London WC2N 4AL',
    name: 'Atlantic Bar @ J Sheekey',
    category: 'Restaurant',
    description: 'Fish and seafood restaurant with horseshoe-shaped bar, an open kitchen and banquette seating.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOIhI0MZ6-WkWjoVqONJLhz4E0zMpe7Qeq8rpYd=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipOWgv-VXUIRjrvydAASrZcErpqdhhRKO16JXDhZ=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipNqJAK0JNFESEfv8cqGWPgAHs6UIJ2-EwQCmgvE=s1920-k-no'
    ]
  },

  acqua_nueva =  {
    address: '5th Floor 240 Regent Street, (Entrance 30 Argyll St) W1F 7EB, London W1B 3BR',
    name: 'Aqua Nueva',
    category: 'Restaurant',
    description: 'A bull guards the entrance to a modern northern Spanish restaurant and roof terrace with city views.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPkK_Y1ZOF0rEHgS4t5eUq0bdLk4-zN03AtgXQO=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipPuVKH-UwlG7R5tJa89gaS1RTzkkUN62GKE5nsf=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipOQsjURQ92S0GN63lT5Ne1mwWWR4_FZOSCW8BNL=s1920-k-no'
    ]
  },

  dalloway_terrace =  {
    address: '16-22 Great Russell St, Fitzrovia, London WC1B 3NN',
    name: 'Dalloway Terrace',
    category: 'Restaurant',
    description: 'A magical atmosphere and stylish design, created to reflect Bloomsbury’s 20th century literary and artistic ambiance.',
    photos: [ 'https://lh5.googleusercontent.com/p/AF1QipMVv8O7_CjaPTaEzFuCD6_UyR50d0qYdEZa_PHJ=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMMvM_4CJwrcJHDQW0k7T7BjL0tyUQPvIR-ixrm=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipOLFotZ8hgzi_dDTbWj3fFwOKJDc2f84MlbJ7tj=s1920-k-no'
    ]
  },

  marquis_cornwallis =  {
    address: '31 Marchmont St, Bloomsbury, London WC1N 1AP',
    name: 'The Marquis Cornwallis',
    category: 'Pub',
    description: 'Traditional pub with large windows, brunch and bar menus and an ornately tiled floor around the bar.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOQwVJ3_521GglGGCU4LLbUyxGrvCg1ixjXHXrG=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipOtBg0u1i9OQ6uAQzPndlJIJkEd51UZctMOfLke=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipMj9I-Wl7tNx-r73jZBU0n1lNTWtUhS9wF_PZ2S=s1920-k-no'
    ]
  },
  
  anchor_bankside =  {
    address: '34 Park St, London SE1 9EF',
    name: 'Anchor Bankside',
    category: 'Pub',
    description: '1615 Thameside pub serving food in bar and restaurant, with real ale and outdoor seating.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPiqPdeYtIxMjqJzLfaqe4_8PTt51Oj-RHvzV25=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipOtmuiiwr_3VJocdMrwtw7FlCLNalY8WdNXivcr=s1920-k-no-pi0-ya130.22643-ro0-fo100',              
              'https://lh5.googleusercontent.com/p/AF1QipMsCaXG8qGRIDBCZW1FU_bS2zibMZaI_7kKnJhD=s1920-k-no'
    ]
  },
  
  duke_of_sussex_waterloo =  {
    address: '23 Baylis Rd, Bishop\'s, London SE1 7AY',
    name: 'The Duke of Sussex',
    category: 'Pub',
    description: 'Spacious gastropub with dark wood tables, decorative skylight, arched window and a beer garden.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOmH3UJYO98O2A8Eg3KF9YrSsoU1HMvPqt9ymuh=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipOEdxOQJ3VFs2iPAo68myWN7f7soD7QrUwvcx_Z=s1920-k-no'
    ]
  },
  
  cafe_del_marsh =  {
    address: '44 Lower Marsh, Bishop\'s, London SE1 7RG',
    name: 'Cafe del Marsh',
    category: 'Bar',
    description: 'Modern cafe with a small courtyard serving coffee and baked goods, plus cocktails and craft beer.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPyB0kkFh42YcAXCwIfrXiGSj1QuADtL7Q3YHCV=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipNTJno9HjTGDirvyyBSwQZepqyc2ejpR9H00OBw=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMaNYwyUEo0bsqBTGTFPGfFQh8qMYzUfjg6tVBA=s1920-k-no'
    ]
  },
  
  granary_square_brass =  {
    address: '1 Granary Square, Kings Cross, London N1C 4AB',
    name: 'Granary Square Brasserie',
    category: 'Restaurant',
    description: 'An extensive menu of bistro fare with vibrant blue interior details, cozy booths, & high ceilings.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNVZgy_Ys2st6psvaCXGqBUHlF76sSrRKABHzwm=s1920-k-no',              
              'https://lh5.googleusercontent.com/p/AF1QipO0ttom0LSWQwl3HqtB0y6R3Zy4oWcFpsdmLsYR=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipO6SnJy3AXe_PvaUwApRipTtYal8Er3nhQoPOHe=s1920-k-no'
    ]
  },
  
  the_lighterman =  {
    address: '3 Granary Square, Kings Cross, London N1C 4BH',
    name: 'The Lighterman',
    category: 'Restaurant',
    description: 'Slickly-designed, minimalist Modern British gastropub with big windows & a canal-side alfresco bar.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMsR_Tr9LyFWZZL39ecxXRvVuhTyjJoku834IeV=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMWi6KpQiJqSUeSTGUQTSM7i5qYOGFZq3VTkhT7=s1920-k-no'
    ]
  },

  the_argyle_holborn =  {
    address: '1 Greville St, Holborn, London EC1N 8PQ',
    name: 'The Argyle',
    category: 'Pub',
    description: 'Contemporary pub interior with a spacious terrace and a menu of pub grub and sharing plates.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMsR_Tr9LyFWZZL39ecxXRvVuhTyjJoku834IeV=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMWi6KpQiJqSUeSTGUQTSM7i5qYOGFZq3VTkhT7=s1920-k-no'
    ]
  },

  flat_iron_square =  {
    address: '53b Southwark St, London SE1 1RU',
    name: 'Flat Iron Square',
    category: 'Bar',
    description: 'Casual food court serving lunchtime favourites such as noodles, pizza, salads & veggie dishes.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMY4EY5uMfZXlfKzzH2jtg77PHia10oq72iioKu=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipPEzc9Fm6lFdHzIuwM7_iamzxmhc-MBHmAb4WD0=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMa2HxCXzgjVvdnLgtmo7XiJ6NBP-OtY-KTYbKP=s1920-k-no'
    ]
  },

  vinegar_yard =  {
    address: '72-82 St Thomas St, Bermondsey, London SE1 3QX',
    name: 'Vinegar Yard',
    category: 'Bar',
    description: 'Buzzy outdoor venue featuring food vendors, bars serving local beer, art installations and boutiques.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNFIRiZP6UAyfTQd3lSKcJFFeZTevxR9pA_uYcM=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipMLpvIjzcVJk_c62Fw9JKGVjshdZGTdE7tBLE-9=s1920-k-no',
              'https://lh5.googleusercontent.com/p/AF1QipNZQdS1_uS2vJbevZ7pEP5W1WQ52azBHpG1CJBQ=s1920-k-no'
    ]
  },

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
  new_venue.save!
end

