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
admin.first_name = "David"
admin.last_name = "Smith"
admin.date_of_birth = Date.today - 10000
admin.address = "180 Ashley Gardens, Emery Hill Street, SW1P 1PD"
admin.save!

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
  #NORTH
  holly_bush = {
    address: "22 Holly Mount, Hampstead, London NW3 6SG, United Kingdom",
    name: "The Holly Bush",
    category: "Pub",
    description: "Traditional 18th-century wood-panelled pub serving cask ales, with fireplace and outdoor space.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOfjjMbB1brjNLP7jN1Ulsda1l3qTaniRIIERti=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPCLAsIuXPKYnpXhe8E6WC1nBx2dNoF3LSRzSHn=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMAS5woK-oQXC2_wHuU58dlH18Li7Ift-gTEyEH=s1920-k-no'
    ]
  },
  garden_gate = {
    address: "14 S End Rd, Hampstead, London NW3 2QE",
    name: "The Garden Gate",
    category: "Pub",
    description: "Wood-panelled 19th-century pub with tasseled lampshades and a large, heated garden.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNfeXfsjVxgRlLPrJyZvh21bZ4fYUckqZkXbnhB=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPXdG5c1LIrThrqJOVEoHhpJBxJJeHmDGnEWSfi=s1920-k-no-pi0-ya77.99999-ro0-fo100',
            'https://lh5.googleusercontent.com/p/AF1QipNXxuc6nrh14KJd8EN5sfgGqayCoKZ8_5HjAG9M=s1920-k-no'
    ]
  },
  the_stag = {
    address: "67 Fleet Rd, Hampstead, London NW3 2QU",
    name: "The Stag",
    category: "Pub",
    description: "High-ceilinged gastropub dating from 1874, with bare brick walls and private cabanas in the garden.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPZZz221nJRuApbWJmmfQbththOwiTBFNI4QycD=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPAHRol5hMPGySF-G6HULxSLZdlOGMMM5w560Wt=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPXFPeCiOooMLJCUJO0eBJUtWSS7JXKm3j5nkyD=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMECw_KsIQKLCMf5UTZqJPz7Op3_inw1IMAay1k=s1920-k-no'
    ]
  },
  the_roebuck = {
    address: '15 Pond St, Hampstead, London NW3 2PN',
    name: "The Roebuck",
    category: "Pub",
    description: "19th-century pub with arched windows, an open fireplace and leather armchairs, plus heated garden.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPIm2fzzeu6puPykWhVOnazkFWnbNacYQfjuEi-=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPWw0MFAJ23uc84-f5uDXwQua6LqxPOG-05Z2nN=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOpI5WVTJx9Fbt1qcAdgIMDz5ExhUDKS_L5cC24=s1920-k-no'
    ]
  },
  the_bull = {
    address: "13 North Hill, Highgate, London N6 4AB",
    name: "The Bull",
    category: "Pub",
    description: "Smart, trendy pub with bay windows, British menu and a selection of beers brewed on the premises.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPIm2fzzeu6puPykWhVOnazkFWnbNacYQfjuEi-=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPWw0MFAJ23uc84-f5uDXwQua6LqxPOG-05Z2nN=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOpI5WVTJx9Fbt1qcAdgIMDz5ExhUDKS_L5cC24=s1920-k-no'
    ]
  },
  the_fellow = {
    address: '24 York Way, Kings Cross, London N1 9AA',
    name: 'The Fellow',
    category: 'Pub',
    description: 'Gastropub for Euro-influenced Modern British food in slick, retro interior big on leather and wood.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPkSSpQPUXaE1KNBS0mGBsM7D9Plvbrx-0a7rO2=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipM5DP5yjRg4wdVpAc8EtIxfco_5Bqo53SvR0YZH=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN8ABSGhUjQCVL_2cEru34t53ueHHHs5LrYtjt9=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN68cYsYSMA-W5pW4igl-ZQ144F3VUO1UWcONjw=s1920-k-no'
    ]
  },
  fawcett = {
    address: '1 Randolph St, London NW1 0SS',
    name: 'The Colonel Fawcett',
    category: 'Pub',
    description: '19th-century gastropub with 30+ varieties of gin, hosting occasional music, comedy and club nights.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPYJ0bsTMuLdM76cS81viMqQydkZzjQiwvq3wrk=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOoowKABWHUD-8dD8zZHtRSt05L8JSTWQgj1QvA=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMJIhcGS2f92FbYeXn7XJwBej3NbRELZK3_pTHK=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPOYvFDKeSlvohnXaJyWnhL-mCaFw9n8Memc2oT=s1920-k-no'
    ]
  },
  prince_albert = {
    address: "163 Royal College St, London NW1 0SG",
    name: "The Prince Albert",
    category: "Pub",
    description: 'Gastropub dining with sustainably sourced ingredients in stripped-back contemporary pub and garden.',
    photos: ['https://geo1.ggpht.com/cbk?output=thumbnail&cb_client=maps_sv.tactile.gps&panoid=IPADd5NOku0HtMrxL79HJA&w=588&h=290&thumb=2&yaw=217.81491&pitch=0'
    ]
  },
  edinboro = {
    address: '57 Mornington Terrace, London NW1 7RU',
    name: "The Edinboro Castle",
    category: "Pub",
    description: "Comfy, relaxed gastropub with a Modern Euro menu of tapas and British pub fare, plus a beer garden.",
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOjlF49nhiuJsgZmBHwby7-gswDmslYCIOIR9ET=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipM4pLcXMy2BeyAcsTcGDt7S0klgMjLOW7QfKhzX=s1920-k-no',
            'http://img.static-bookatable.com/498/332/b9577ba625d609511d53098eb4b0f419.jpg?404=bat2/404-restaurant.jpgmode=crop'
    ]
  },
  old_eagle = {
    address: '251 Royal College St, London NW1 9LU',
    name: 'The Old Eagle',
    category: 'Pub',
    description: 'Pub with quirky, musical-themed decor.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMT2YzIZ_ehFghlxUFy8RC2L4mkGDilgBhz5bNq=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipO7uCuBU6ynU21PsxG_D9I3b0iJzwZFtzEOmCzq=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOyo-zsVqw2sXdG28JmR3tvfT_UZEv0BL5ZNk6m=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN1WvGOgRLdeY3gy_QwY16P4vdlBTAuE3tJwhD7=s1920-k-no'
    ]
  },
  hawley_arms = {
    address: '2 Castlehaven Rd, Camden Town, London NW1 8QU',
    name: 'The Hawley Arms',
    category: 'Pub',
    description: 'Pub with autographed rock star hall of fame pictures, walled garden, upstairs bar and roof terrace.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipP7PoUZTuyiSn0zLUgDuUrhQFzaocZrTdY-8c8X=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipO8NUL8KDOvrBKoSdz9MMLAEEofbqEANOW_VYSN=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOrz3_X4BQOyKsALWl1kxSr1xkQGobTTV3kHjwx=s1920-k-no'
    ]
  },
  engineer = {
    address: '65 Gloucester Ave, Chalk Farm, London NW1 8JD',
    name: 'The Engineer',
    category: 'Pub',
    description: 'Stylish gastropub on 2 floors with a carefully prepared seasonal menu of dishes for all appetites.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOQtztVa3s3YXKM0i4tJdt7jzAO25gYfCUquVGt=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN4YVtqNGBktVn4U7b580mLHSRzJMYQvHEMUNoP=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPJtHWpghfiB-ecFJOKXzPUFmkizGT4H1up3ytv=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOCMEYX2ij8DT9NOigaVnyL0EFaq95oZGyrBJmm=s1920-k-no'
    ]
  },
  faltering_fullback = {
    address: '19 Perth Rd, Stroud Green, London N4 3HB',
    name: 'The Faltering Fullback',
    category: 'Pub',
    description: 'Rambling pub with bric-a-brac and vintage posters, plus spacious beer garden and menu of Thai food.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNDFnB7igVzKNfb0TaOGod7YQ9QMYN-R6ES0TDh=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipM2Amu0J5Ca6-8d55_pii09knqnDYVQN7gzvvWQ=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMaCsihhbtwVBSBgy0mnAc9yfV0l8OKA-Lavprc=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOW92188FRzVKPyxB9YXgyCjcAvbl0S8ZyrB0YP=s1920-k-no'
    ]
  },
  vine = {
    address: '86 Highgate Rd, Kentish Town, London NW5 1PB',
    name: 'The Vine',
    category: 'Pub',
    description: 'Big old pub set back from the road with front garden, numerous interior rooms and a gastropub menu.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMr7xrLeC07UVHoywSlw9DCEmdCyvK8ZMjxSCLs=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPaqgb27wCDYpaDdKysuygbDbbJDnfGdPIlMcaL=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPQx2ciMqZ0BWJq3nEACOaMxopIC97VxAz7XYr7=s1920-k-no'
    ]
  },
  pineapple = {
    address: '51 Leverton St, Kentish Town, London NW5 2NX',
    name: 'The Pineapple',
    category: 'Pub',
    description: 'Built in 1868, this pub with traditional decor offers a changing beer list, Thai food & board games.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNG9B-8midSJduSNTdrIfPqBjXFF4NTQE0XjbFY=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOcsIBQsLbfs0u4sRvEAbMBJeQAF3Hxi0RXfdW0=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNvYcl3ARVgbSuBFb73YGBZjZExXS-pRSkZCqDP=s1920-k-no'
    ]
  },
  gipsy_queen = {
    address: '166 Malden Rd, London NW5 4BS',
    name: 'The Gipsy Queen',
    category: 'Pub',
    description: 'Renovated Victorian pub now housing a funky craft beer venue serving eclectic cuisine.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMdX5oW6Ew_6IMDIs-2OsK9HKGy_4D6CCLWE5Zs=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOHeYt-NusoL_U8AhaGxcKXfhO2OoscCplluavU=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOBdogik5uiPEM8ZUFizLDI-QR7MSHYYckKGt1n=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPWrBGzyW_9tzF4SrdE7OUPpPy_cy0ShuqaILLK=s1920-k-no'
    ]
  },
  abbey = {
    address: '124 Kentish Town Rd, Kentish Town, London NW1 9QB',
    name: 'The Abbey Tavern',
    category: 'Pub',
    description: 'Pub with rooftop garden, regular open mic and comedy nights, plus food from hog roasts to burgers.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipP8E48nTCwLCXW_AqiIzGBYmmRt-nX0m5D9C69m=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipP1b6K96pX55Immj1jRF5NDC3-O52FBR09ALWpU=s1920-k-no-pi-20-ya0.6000177-ro0-fo100',
            'https://lh5.googleusercontent.com/p/AF1QipPeBICvRC5ydJfWpe1Q_azp9ZW4WRNYfVQqnCmX=s1920-k-no'
    ]
  },
  castle = {
    address: '54 Pentonville Rd, The Angel, London N1 9HF',
    name: 'The Castle',
    category: 'Pub',
    description: 'Light-filled pub with colourful fabrics and vintage trimmings, plus decked roof terrace.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMM5crRLgDp5Fx1dDYNcuMyYXDyPD25jog_PsBT=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipP-8uTdWdhTcNfPC7Q9bAC7MEw1bkvehlYRkueW=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNJ-O3Dj8w9iX891g48wFxJW9QVQv6J0oeBVAqJ=s1920-k-no'
    ]
  },
  spaniards_inn = {
    address: 'Spaniards Rd, Hampstead, London NW3 7JJ',
    name: 'The Spaniards Inn',
    category: 'Pub',
    description: 'Wood-panelled pub with homely fireplace and large garden for outdoor pints and comfort food.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOa7bFRmavShJwvAAlJbpW4255Dx_28_mIx5cGC=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOBYQSRnzLXGsT9PuQ9aPzKKkMwFz6FfJtj9n4X=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNlSk4hGtmYm_geG93cJkIDFDAAs4JP1cItnfBe=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN-5lN3x5pehpvRmtkZd5UFXwITLNepEq1dImnz=s1920-k-no'
    ]
  },
  hicce = {
    address: 'Unit 102, hicce x Wolf & Badger, Stable St, London N1C 4DQ',
    name: 'Hicce',
    category: 'Restaurant',
    description: 'Airy, brick-exposed eatery offering modern, sharable plates cooked over a wood fire.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMwf9OE7qyyZoHchoRClI3vYlCLahqQBuedW0MF=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPGOykD6ke4Wh-47vvybFbqQEXNs6fp68S0ZvHY=s1920-k-no'
    ]
  },
  swimmer = {
    address: '13 Eburne Rd, London N7 6AR',
    name: 'The Swimmer at the Grafton Arms',
    category: 'Pub',
    description: 'Lovely local with generous food portions',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipM6yKqPVODqigojZbAQLQuUesFB1uEVlCJpFl9k=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOMLTVWqqWZ_MBArxWl9FYfz6J8gBj2vy61tSeV=s1920-k-no'
    ]
  },
  yeats = {
    address: '20 Fonthill Rd, Finsbury Park, London N4 3HU',
    name: 'The WB Yeats',
    category: 'Pub',
    description: 'Classic British pub pairing pub grub with craft & cask ales in a comfy setting with music & games.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipM73tKwVCJiRjXYqiKpn1LebbQWG_w8N0zYmkv7=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOb9rfEKP3yzQq61TX-ZA3CXlx8QbX8_iwBCan-=s1920-k-no'
    ]
  },
  landseer = {
    address: '37 Landseer Rd, London N19 4JU',
    name: 'The Landseer Arms',
    category: 'Pub',
    description: 'Spacious, traditional pub with a family-friendly outdoor area offering modern dishes & pizza.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOnua46owfiltzPVXba9Vjqz5wrDWTxKFaw44uP=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOoMKebu7WjWiSjum-lx_wU2AGTdPN-KBoBtcZL=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPFZt-AAF0hFsJ30pcfbTwiNynS47T4g32CUUcu=s1920-k-no',
            'https://lh6.googleusercontent.com/proxy/MAi6T8uwWVptczkfjnSfDsBK6b5GKbqxm6QtJhMS0B71Dla8Hk0ObZ5WZCNnTnSSKeH_3yP-IJU61B_QCK18O6l2iyGN8_UTx1TWWi4z0u1HRSwNP2iRi1r_oLb_AMlg4el6fgdrgRMEDT3UUjn3CNwp_bg=w1920-h1080-k-no'
    ]
  },
  higbury_barn = {
    address: '26 Highbury Park, Highbury East, London N5 2AB',
    name: 'The Highbury Barn Tavern',
    category: 'Pub',
    description: 'Bright, modern pub with a history going back to 1770, a British menu and Sunday lunches.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMfaBM6Ae3oBWc2ZBt0nRpFHbqd3zE8k8TOaU3x=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMmtOfI4u5gJs9PxjFLx1wJIybm4CHbnY-EtEOt=s1920-k-no'
    ]
  },
  clissold = {
    address: '177 Green Lanes, Highbury East, London N16 9DB',
    name: 'The Clissold Park Tavern',
    category: 'Pub',
    description: 'Laid-back watering hole featuring pizza & other Italian eats, plus live music & a beer garden.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPd7G2EdL1Jh2CRJR74lFPeWtbp3Fq7kYnW7BQS=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMOqqBnBlHJS16I3MGR-By5wmdZwTn53exTUg61=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPIskhQR857hz0MFiMahR16T_v3sVvLhHUD_ZLx=s1920-k-no'
    ]
  },
  finsbury = {
    address: '336 Green Lanes, Finsbury Park, London N4 1BY',
    name: 'The Finsbury',
    category: 'Pub',
    description: 'Spacious pub & beer garden serving breakfast food & pizza with live music events.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMovMld5ncJxjBkzJaI_SRqj4SKSb1QpRm-y45r=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNDLbqS83cfdzLxznD-JQjlauzTso65T5IZWuq0=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipP1Zv7coAPlpDaJLxv4VD6mS4PgXSgBVxGbFm2p=s1920-k-no'
    ]
  },
  railway = {
    address: '23 Crouch End Hill, Crouch End, London N8 8DH',
    name: 'The Railway Tavern',
    category: 'Pub',
    description: '1930s pub with a simple menu, partitioned areas, open fireplaces and an enclosed patio garden.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNIj6bmv1lzZE0K17Dz2SAV2i5S3b2Cxyh362LS=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPQ7oxd4H_hI0EeCus-jWMleQIPUUwH8ZQmniBa=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMr4hAIeTvXNnKHZ26Y4SOg5nxHaqYOhvUw3wtQ=s1920-k-no'
    ]
  },
  flask = {
    address: '77 Highgate W Hill, Highgate, London N6 6BU',
    name: 'The Flask',
    category: 'Pub',
    description: 'Snugs, real fires and a beer garden in reputed former haunt of Dick Turpin with a ghostly past.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMQEENZQgC8Ri4TT_n3ttuptU73JIVCcpycAnrV=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNy7lV9Y6Ds9D7zJRC6h14KcFa6qXusj5DaV00t=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNtSc3gNngZRAWyMhy5lcrZBvFbmgz5MoW2b-JI=s1920-k-no-pi-10-ya51.266457-ro0-fo100'
    ]
  },
  #WEST
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
  },
  # SOUTH
  theavalon = {
    address: '16 Balham Hill, Clapham South, London SW12 9EB',
    name: 'The Avalon',
    category: 'Pub',
    description: 'Large gastropub with Victorian fixtures and terraced beer garden, serving classic British dishes.' ,
    photos: ['https://lh5.googleusercontent.com/p/AF1QipMxp64SzfMtSPiGe1e4ekQ17kMj7tn8na5VTNzi=s1920-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPr_nfjGckCJJrus178ZVlQAqv8k5AQWhLwYhnY=s1920-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPoYzdHLq8sJL0sl3JzbwJb130q-LUPae_DTze5=s1920-k-no'
    ]
  },
  boro_bistro = {
    address: '6-10 Borough High St, London SE1 9QQ',
    name: 'Boro Bistro',
    category: 'Restaurant',
    description: 'Cozy French spot with garden terrace serving cheese & meat boards, tapas-style dishes & wines.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOeuM6qZCjSKnEJg2dUlaQO6SN6FIKPxiuXAz-d=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPl3TZ8wYVvgMmdt_iQVTQwEcqn3N-K2_wigHJ6=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPVCEa77WPhpGLRPtkXKaDTLWQ4vQOZPB067RDe=s1920-k-no'
    ]
  },
  tamesis_dock = {
    address: 'Albert Embankment, Vauxhall, London SE1 7TY',
    name: 'Tamesis Dock',
    category: 'Bar',
    description: 'Brightly painted barge floating on the Thames, with views of Parliament, outdoor space and a bar.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPRNNOZ5aFYqm7__X9o1WDoCG09YGSxvll7kzC8=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipM1GRJ9prFoErwnBnIpjPgkR9qjebcLBqFYH7Iz=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPEYKN-iZ8_4S3Ea50IixogmXtMF3BcG4v0oeX-=s1920-k-no'
    ]
  },
  thedevonshire = {
    address: '39 Balham High Rd, Balham, London SW12 9AN',
    name: 'The Devonshire',
    category: 'Pub',
    description: 'Spacious and stylish, high-ceilinged pub with chandeliers, contemporary sofas and wooden floors.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipM-JAEpjbsApM5y4RhnwwfaW2F77hZ3bIjeQaDp=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipN40VhYOTlDSgGMLLQ3w3fVlfAwAEEVgjgJ5G_t=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipOuB_rPJknC1myAXoS7bXz0gnc6WCocnoZ2SSf0=s1920-k-no'
    ]
  },
  thecyclist = {
    address: '194 Balham High Rd, Balham, London SW12 9BP',
    name: 'The Cyclist',
    category: 'Pub',
    description: 'Modern gastropub for craft beers, cocktails & a menu that includes weekend brunches & Sunday roasts.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPMADIKDmDF8fznM7sVUwQphRj_lz83iTOKosjx=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPVa1x8l82Zme6yFgDk5lBtEf9IQ6lcgC3RRysM=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipMz0brBcGU1PmWE10qmgkjKVv80ISrLoTDX6e-4=s1920-k-no'
    ]
  },
  thebedford = {
    address: '77 Bedford Hill, Balham, London SW12 9HD',
    name: 'The Bedford',
    category: 'Pub',
    description: 'Pints and pub grub on 3 floors with live music, comedy, cabaret, dance classes and TV sports',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOZ6hZuq5bwHVIKLL8lv2bfll3-ckNJohPzhTNS=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipM5UdrILfvrIBWzbEeAm8mE6Y7mNJGGI3tdib0N=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipOc5c3_N4rVzQ0yedrXenqOVCmP6QC8AklDM0h3=s1920-k-no'
    ]
  },
  thetrafalgar = {
    address: '148-156 Tooting High St, Tooting, London SW17 0RT',
    name: 'The Trafalgar',
    category: 'Pub',
    description: 'Convivial boozer with deep sofas, open fires and a classic pub menu offering NHS staff discounts.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipM6lDLxP_i5WLCLQkt8NOr_H3QjamxxwpBybBTp=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipNleyyisDX4iBtoIwfe67HAQXHv7cwuXWHUdIFM=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPGSAYsyVEfDjeYC_R7OJNEc0iDEqJyFYKt8Q=s1920-k-no'
    ]
  },
  the_rose_and_crown = {
    address: '140 Tooting Bec Rd, London SW17 8BH',
    name: 'The Rose & Crown',
    category: 'Pub',
    description: 'Festive local pub with a patio & big screen TVs serving inventive pizzas, craft beer & cocktails.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOJ0gv-SiNeZoxwTtY-7jxjObY5wB10tkVomi8K=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPqST4V8aSPfTbPGo7L5fZVG78sluD6QweI-sR6=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN2I4Y5wC-nqAyS3nTOIQ-DyjrygobRMI0l9sDq=s1920-k-no'
            ]
  },
  the_ship = {
    address: '41 Jews Row, Wandsworth, London SW18 1TB',
    name: 'The Ship',
    category: 'Pub',
    description: '1786 gastropub with a wood-burning stove, riverside terrace and outdoor barbecue kitchen.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNE5kc_EdrsllwsXmkLZGimhDxHubwGRNoHm3r6=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipMlMuJdaeobmD3b7QMc4XFUbVAHo3mGFN_hDB8m=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipOZTfjJjfIa3WFCzrs-z0_WMrduKyFdLiwPzywl=s1920-k-no'
    ]
  },
  the_cats_back = {
    address: '86-88 Point Pleasant, London SW18 1PP',
    name: 'The Cat\'s Back',
    category: 'Pub',
    description: 'Dog-friendly Edwardian pub with a green-tiled facade and decked beer garden.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipOHCfyf2D6_M-GEi7cEPVZKKqWA28fwczEf_yOA=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPn4odV-TH4YruBp2SULL0_ODF-guhIwZ7bGI_0=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipPjCkDtzOZbgn7t0OS0g6pYNJpFjkeaMaFlw1Tz=s1920-k-no'
    ]
  },
  the_kings_arms = {
    address: '94-96 Wandsworth High St, Wandsworth, London SW18 4LB',
    name: 'The King\'s Arms',
    category: 'Pub',
    description: 'Bar with exposed brick, wood floors & garden seating, offering brunch-style dishes & craft drinks.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipPili_6GMyWnQOwfMUs7wpFsucECJhONVJZAExL=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipOKXcvqMYeD-7J6JkCaV6oqTKezUzn1pbYZSzF1=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipMArLqP3z0AumZ40JKwpqTQ12LDU_nIV29E1X-a=s1920-k-no'
  ]
  },
  the_coat_and_badge = {
    address: '8 Lacy Rd, Putney, London SW15 1NL',
    name: 'The Coat & Badge',
    category: 'Pub',
    description: 'Large pub hidden behind laurel bushes with quirky, beach-lounge style decor and live TV sport.',
    photos: ['https://lh5.googleusercontent.com/p/AF1QipNmD0tFe82Y478jSxvr9rb8rnLquO6pp-0GG3Er=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipNHmo-grh4ZYpr9gxnBLNVQ9fuwgwRGOADM8cYy=s1920-k-no',
     'https://lh5.googleusercontent.com/p/AF1QipNKHtXvgO4I2et3e--9bYgcUnVKilec5517OgAn=s1920-k-no'
    ]
  },
  #EAST
  crate = {
    address: "Unit 7 Queen's Yard, Hackney Wick, London E9 5EN",
    name: "CRATE brewery",
    category: "Bar",
    description: "Bar in old factory with recycled decor and its own micro-brewery plus inventive pizzas and DJ sets.",
    photos:['https://lh5.googleusercontent.com/p/AF1QipNL4GF971kT4cl_3FI-FiVykDgBJcPH0umvmO2Y=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMvu1uw8X2pCHMwZDiXt7lLMMqVkubWdok9SiIz=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipM5g1SoFNCKNImfW7uJ--3rGbolUXKK8ie3XIpT=s1920-k-no'
    ]
  },
  well_and_bucket = {
    address: '143 Bethnal Green Rd, London E2 7DG',
    name: 'Well and Bucket',
    category: 'Pub',
    description: 'Adulterated portraits and shabby-chic original features fill this revamped bar and oyster house.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipNhf4k23f2A_fqLaDFjJkvUqecd_iNWEPI9X0QG=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOVjlFs1-MwzXCZZ9snICenyZbxuGA3GVqMX5DN=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPZiygXli5rNukeKxqySznOl-IaPGKT-7chBSdB=s1920-k-no'
    ]
  },
  old_fountain = {
    address: '3 Baldwin St, Old Street, London EC1V 9NU',
    name: 'The Old Fountain',
    category: 'Pub',
    description: 'Freehouse with a rotating selection of cask ales, a classic pub food menu and its own roof terrace.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipNa7ocyPsbbTCq1bSkbRxE5s5nvNEkHksX035ad=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMhTwdgXonIe-QQ5SCQkgn-DacYeVgjKba4aBeX=s1920-k-no'
    ]
  },
  chesham_arms = {
    address: 'East London Public House, 15 Mehetabel Rd, London E9 6DU',
    name: 'The Chesham Arms',
    category: "Pub",
    description: 'Cosy traditional pub with stripped floors and leafy beer garden, for real ales and a gastropub menu.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipM3JWXSQZ30sYCys0Pjg4oWfpTAXsjdVJd2OGjc=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNIl95mip-Dt8yLoHGrz--oOv7mQomw2luNw-XZ=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMoGdKjX02RGJUnWdwsT1-AO0ObFnufP-_7hE_y=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPsNPCBKqoZz81iglzbloPxCOrOlH7Ys_Aemh4Z=s1920-k-no'
    ]
  },
  adam_and_eve = {
    address: '155 Homerton High St, Homerton, London E9 6AS',
    name: 'The Adam and Eve',
    category: 'Pub',
    description: 'Carefully sourced ingredients elevate classic Brit grub at this pub with beer garden and pool table.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipPz8J_OqYz0NOyyvC2pngxveQ5H3R-K4y9Eg0Vo=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNUzvcfzLCm05_JfoVrUc-zCHJAwxUeeIEzYfY_=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipN70C8VMFt_6J909pXYhlRM61InO9knsox8-_sO=s1920-k-no'
    ]
  },
  crooked_billet = {
    address: '84 Upper Clapton Rd, Clapton, London E5 9JP',
    name: 'The Crooked Billet',
    category: 'Pub',
    description: 'Restored, bright joint serving local real ale and pub meals, with beer garden and ping-pong table.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipNQvS0Y4Nf5GckPynFE3kwaOUKp1MCQEJNNK5gj=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMAZUTP5ZaHAmE45fx1PgVy9Ya1ccEb4i2NPAjt=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOTAQqeIvLFUUucGVZEhqcwWANLidFArWp56yTP=s1920-k-no'
    ]
  },
  on_the_park = {
    address: '19 Martello St, Hackney, London E8 3PE',
    name: 'Pub On The Park',
    category: 'Pub',
    description: 'Airy traditional pub with sofas and standard lamps, park-side beer garden, boules and weekend DJs.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipMSXBUPfTXo9e6NJcpl7I9zP4_bLitV_BLKrBPi=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMJtS2vtJ9VPTRsTRusKzRWdFX5CKqDQucHYmU7=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPNYh3aXwxfxLXmRdvI_YG7lNSW5GQob6G9XzYH=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPwl1R2KsGeXYZZ_7dntCSObbIDf8qa2l2DiIpf=s1920-k-no'
    ]
  },
  crown_shuttle = {
    address: '226 Shoreditch High St, Hackney, London E1 6PJ',
    name: 'The Crown & Shuttle',
    category: 'Bar',
    description: 'Hip, bar with exposed brick and junkyard decor, craft beers and a large garden with food truck.',
    photos:['https://lh5.googleusercontent.com/p/AF1QipOJWkD66oKeVP2l9Thq71NUKKrQTpVVhwaOcdGV=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPuS1Q_sh6t_A8osfc9YDdqlaV35ZHPbrWYOUb6=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOzvgwzXKUPEr8ugHxfqGnOkRwYCQnwvRfuGOmT=s1920-k-no'
    ]
  },
  three_compasses = {
    address: '99 Dalston Ln, Dalston, London E8 1NH',
    name: 'The Three Compasses',
    category: 'Pub',
    description: 'Fashionable local with a beer terrace to the front and a regular list of live music and DJ nights.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipO6EQ9IlOXmdtmQ2GMhTbsdIjWJ5Kc0RpI5e_Ky=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMlSRTCVARKD9HyREUPhHG-WcZFYElBPAkwhcnP=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipM7SLD0Pgyr0lfKgbESQNXzm4iycNs2S-ZuK0XM=s1920-k-no'
    ]
  },
  royal_inn = {
    address: '111 Lauriston Rd, London E9 7HJ',
    name: 'The Royal Inn on the Park',
    category: 'Pub',
    description: 'Outside seating circles this pub with a classic menu, making it feel like part of the park itself.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipN5j44y7oMNNxwGLmtMv_2WzN0IMDxBF7rw3qSF=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMjgIWCniwKJG9RHa93vO5by011_AO1mD3avI9W=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipOiw_ZGcoiu7A_ug6w1YWxQcKAqu9xYhkHIb7D4=s1920-k-no'
    ]
  },
  peoples_park = {
    address: '360 Victoria Park Rd, London E9 7BT',
    name: "The People's Park Tavern",
    category: 'Pub',
    description: 'Pub with large outside seating area situated between two green spaces',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipPaRzTfnLeoJCDfXkhg3fQ473aSzZ84yhz-681g=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPt8MemykRjSuwGgbTUkoiLPR-XQxMshMLdWrET=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMUNL5AFDJBGsS16In0LG5cnvq6rYrI25uJQnX0=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipMNk9nGc9sihXQJK6dt9A0404sSUS__e3mJFw0r=s1920-k-no'
    ]
  },
  print_house = {
    address: '133 High St, London E15 2RB',
    name: 'The Print House Bar & Kitchen',
    category: 'Bar',
    description: 'Relaxed, airy bar with an open kitchen and terrace, for wines, cocktails and a gastropub menu.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipPtyqQs3AURWFc67J7UmehoRwf48nngidsRJoVI=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNFOAKyZUve4Dsbqu_6DyGwvCAQlSXnpePEGZGW=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipPJ_LlIH2xtGdsu80k6tMAl5bmvT4ECcvsrKC8D=s1920-k-no'
    ]
  },
  dundee = {
    address: '339 Cambridge Heath Rd, London E2 9LH',
    name: 'The Dundee Arms',
    category: 'Pub',
    description: 'Low-lit, traditional boozer with a courtyard and draught craft beers, hosting regular DJ sessions.',
    photos:[ 'https://lh5.googleusercontent.com/p/AF1QipMAU7qdHtEUvX7UIb5yOn734AHDUmINKnrpLzgE=s1920-k-no'
    ]
  },
  syklight = {
    address: "Tobacco Dock, Pennington St entrance, St Katharine's & Wapping, London E1W 2SF",
    name: 'Skylight Rooftop',
    category: 'Bar',
    description: 'Events venue with large outdoor rooftop.',
    photos:['https://lh5.googleusercontent.com/p/AF1QipNfnUsN8Pkyf0ui4729uWf1zS7x-WUGsGnQdiqs=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNgoz3NFaixF5HdV5dfiiTR7qIQszGrG906JmiE=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNm4QAW_SHIzx8EryqnJ_jDXP8UPboEjFdFStUM=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipNOnpG9OAgv9Dmz4XXsqe5gk0h9AbM2SRalZ1QY=s1920-k-no'
    ]
  },
  rusty_bike = {
    address: '588 Mile End Rd, Mile End, London E3 4PH',
    name: 'The Rusty Bike',
    category: 'Pub',
    description: 'Modern bar with outdoor terrace specialising in Thai food & selection of global beers.',
    photos:['https://lh5.googleusercontent.com/p/AF1QipMnPE9SOst6i3A51sebDgFIkBuzXDPLEkQ5gF0R=s1920-k-no',
            'https://lh5.googleusercontent.com/p/AF1QipO8Jwpuxbq96F8kp0_0L5CwLa3frMXKW2ByVUnZ=s1920-k-no'
    ]
  }
]

# address:
# name:
# category:
# description:
# photos:[
# ]

venue_array.each_slice(10) do | slice |
  GenerateVenueJob.perform_now(slice)
end

# venue_array.each do |venue|
#   new_venue = Venue.create(address: venue[:address], name: venue[:name], category: venue[:category], description: venue[:description], user: User.first)
#   puts "generating #{venue[:name]}"
#   venue[:photos].each_with_index do |photo, index|
#     file = URI.open(photo)
#     title = venue[:name].gsub(/\s/, "")
#     new_venue.photos.attach(io: file, filename: "#{title}-image-#{index + 1}.jpg", content_type: 'image/jpg')
#   end
#   new_venue.save!
#   puts "generated, pausing..."
#   sleep(1)
# end

