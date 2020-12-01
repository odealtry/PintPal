class GenerateVenueJob < ApplicationJob
  queue_as :default

  def perform(venue_array)
    venue_array.each do |venue|
      new_venue = Venue.create(address: venue[:address], name: venue[:name], category: venue[:category], description: venue[:description], user: User.first)
      puts "generating #{venue[:name]}"
      venue[:photos].each_with_index do |photo, index|
        file = URI.open(photo)
        title = venue[:name].gsub(/\s/, "")
        new_venue.photos.attach(io: file, filename: "#{title}-image-#{index + 1}.jpg", content_type: 'image/jpg')
      end
      new_venue.save!
      puts "generated, pausing..."
      sleep(1)
    end
  end
end
