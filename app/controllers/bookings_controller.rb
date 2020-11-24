class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      redirect_to venue_booking_path(@venue, @booking)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to venue_booking_path(@venue, @booking)
    else
      render :edit
    end
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

end

