class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @venue = Venue.find(params[:id])
    reviews = Review.all.where(venue_id: @venue.id)
    rating_sum = 0
    reviews.each do |review|
      rating_sum += review.overall_rating
    end
    @venue_overall_rating = rating_sum / reviews.count
  end

  private
  def strong_params
    params.require(:venue).permit(:name, :address, :photos)
  end
end
