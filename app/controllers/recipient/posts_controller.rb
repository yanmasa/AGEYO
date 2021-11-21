class Recipient::PostsController < ApplicationController
  def index
    @posts = Post.where(status: '公開').order(params[:sort])
  end

  def show
    @post = Post.find(params[:id])
    @contributor = @post.contributor
    @recipient = current_recipient
  end
end
