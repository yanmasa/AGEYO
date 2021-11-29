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
      @room = Room.find(params[:room_id])
      @recipient = Recipient.find(@room.recipient_id)
      @post = Post.find(@room.post_id)
      @contributor = Contributor.find(@post.contributor_id)
      @messages = Message.where(room_id: @room.id)
      render 'rooms/show'
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
