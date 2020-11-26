class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.chatroom = Chatroom.find(params[:chatroom_id])
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(@message.chatroom, render_to_string(partial: "message", locals: { message: @message }))
      redirect_to venue_booking_chatroom_path(@message.chatroom.booking.venue, @message.chatroom.booking, @message.chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
