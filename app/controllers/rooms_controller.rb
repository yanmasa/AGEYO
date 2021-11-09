class RoomsController < ApplicationController
  def create
    @room = Room.new
    @room.post_id = params[:room][:post_id]
    @room.recipient_id = params[:room][:recipient_id]
    if @room.save
      redirect_to room_path(@room)
    else
      redirect_to request.referer
    end
  end

  def show
    @room = Room.find(params[:id])
    @recipient = Recipient.find(@room.recipient_id)
    @post = Post.find(@room.post_id)
    @contributor = Contributor.find(@post.contributor_id)
    @messages = Message.where(room_id: @room.id)
    @message = Message.new
  end
end
