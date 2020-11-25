class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @user = @chatroom.user
    @venue_user = @chatroom.venue.user
    @message = Message.new
  end
end
