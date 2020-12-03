class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    booking = Booking.find(params["booking_id"])
    booking.update(to_be_reviewed: false)
    @review.user = booking.user
    @review.venue = booking.venue
    @review.updated = true
    @review.save
    flash[:alert] = "Thanks for your review"
    redirect_to profile_path
  end

  def edit
  end

  def index
    @venue = Venue.find(params[:venue_id])
  end

  def update
    @review.updated = true
    @review.update(review_params)
    booking = Booking.find(params["booking_id"])
    booking.update(to_be_reviewed: false)
    redirect_to profile_path
  end

  private
  def review_params
    params.require(:review).permit(:overall_rating, :heat_rating, :pricing_rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
