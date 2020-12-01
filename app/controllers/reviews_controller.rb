class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    booking = Booking.find(params["booking_id"])
    @review.user = booking.user
    @review.venue = booking.venue
    @review.save
    redirect_to profile_path
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to profile_path
  end

  private
  def review_params
    params.require(:review).permit(:outdoor_rating, :heat_rating, :pricing_rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
