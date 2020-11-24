class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :length, :party_size)
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

end

