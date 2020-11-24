class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

