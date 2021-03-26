class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @venue = Venue.find(params[:id])
    reviews = Review.all.where(venue_id: @venue.id)
    if reviews.count.zero?
      @venue_overall_rating
    else
      overall_sum = 0
      heating_sum = 0
      pricing_sum = 0
      reviews.each do |review|
        overall_sum += review.overall_rating
        heating_sum += review.heat_rating
        pricing_sum += review.pricing_rating
      end
      @venue_overall_rating = overall_sum / reviews.count
      @venue_heating_rating = heating_sum / reviews.count
      @venue_pricing_rating = pricing_sum / reviews.count
    end
  end

  private

  def strong_params
    params.require(:venue).permit(:name, :address, :photos)
  end
end
