class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept_booking]
  def new
    @booking = Booking.new
    @bookings = Booking.all
    @shortlist = @bookings.select { |booking| booking.user == current_user && booking.confirmed == false }.count
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    chatroom = Chatroom.new(booking: @booking)
    @booking.chatroom = chatroom
    if @booking.save
      chatroom.save
      # Chatroom.create(booking: @booking)
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
    if @booking.chatroom
      @booking.chatroom.destroy
      @booking.delete
    end
    redirect_to shortlist_path
  end

  def index
    bookings = Booking.all
    @user_bookings = bookings.select { |booking| booking.user_id == current_user.id && booking.confirmed }
    @venue = Venue.where(user_id: current_user.id)
    # For now our admin user is linked to all the bookings
    # @venue_bookings = bookings.select { |booking| booking.venue == @venue.first }
    @venue_bookings = Booking.all
  end

  def accept_booking   
    @booking.confirmed = true
    @booking.save    
    redirect_to venue_booking_path(@booking.venue, @booking)
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

