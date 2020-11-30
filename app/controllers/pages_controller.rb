class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue }),
        image_url: helpers.asset_url('fire.png')
      }
    end
  end

  def shortlist
    @user = current_user
    @user_bookings = Booking.all.where(user_id: current_user)
    # @shortlist = @user_bookings.select { |booking| booking.confirmed == false }
  end

  def profile
    @user = current_user
    @user_profile = User.all.where(user_id: current_user)
  end
end
