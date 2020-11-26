class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @booking = @chatroom.booking
    @venue = @chatroom.booking.venue
    @user = @booking.user
    @venue_user = @venue.user
    @message = Message.new
  end
end
