class Recipient::RequestsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @request = current_recipient.requests.new(post_id: @post.id)
    @request.save
    redirect_to request.referer
  end
end
