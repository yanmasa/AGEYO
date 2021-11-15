class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.room_id = params[:room_id]
    unless recipient_signed_in?
      @message.is_recipient = false
    end
    if @message.save
      redirect_to request.referer
    else
      render 'rooms/show'
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
