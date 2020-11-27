class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def shortlist
    @user = current_user
    @user_bookings = Booking.all.where(user_id: current_user)
    # @shortlist = @user_bookings.select { |booking| booking.confirmed == false }
  end
end

        # case venue.name
        # when "the court"
        #   images_array = ["the_court_1.png", "the_court_2.png", "the_court_3.png"]
        # when "the phene"
        #   images_array = ["the_phene_1.png", "the_phene_2.png", "the_phene_3.png"]
        # when "the duke of edinburgh"
        #   images_array = ["d_of_e_1.png", "d_of_e_2.png", "d_of_e_3.png"]
        # end,
