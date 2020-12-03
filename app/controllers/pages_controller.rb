class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @venues = Venue.all    
    @markers = @venues.geocoded.map do |venue|
      reviews = Review.all.where(venue_id: venue.id)
      rating_sum = 0
      reviews.each do |review|
      rating_sum += review.overall_rating
      @venue_overall_rating = rating_sum / reviews.count
    end
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue, 
        venue_overall_rating: @venue_overall_rating, reviews: reviews }),
        image_url: helpers.asset_url('fire.png')
      }
    end
  end

  def shortlist
    @user = current_user
    @user_bookings = Booking.all.where(user_id: current_user)
    # @shortlist = @user_bookings.select { |booking| booking.confirmed == false }
    @now = Time.zone.now
  end

  def profile
    @user = current_user
    @user_profile = User.all.where(user_id: current_user)
    @user_reviews = Review.where(user_id: current_user)
  end

  def map
    @venues = Venue.all    
    @markers = @venues.geocoded.map do |venue|
      reviews = Review.all.where(venue_id: venue.id)
      rating_sum = 0
      reviews.each do |review|
      rating_sum += review.overall_rating
      @venue_overall_rating = rating_sum / reviews.count
    end
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue, 
        venue_overall_rating: @venue_overall_rating, reviews: reviews }),
        image_url: helpers.asset_url('fire.png')
      }
    end
  end
end
