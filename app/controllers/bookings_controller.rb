class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      redirect_to shortlist_path(@booking.user)
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
    @booking.delete
    redirect_to venue_path(@venue)
  end

  def index
    bookings = Booking.all
    @user_bookings = bookings.select { |booking| booking.user_id == current_user.id && booking.confirmed == true }
    @venue = Venue.where(user_id: current_user.id)
    @venue_bookings = bookings.select { |booking| booking.venue == @venue.first }
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

