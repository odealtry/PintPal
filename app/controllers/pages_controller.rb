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
    @user = User.find(params[:id])
    @shortlist = Booking.all.where(user_id: current_user)
  end
end
