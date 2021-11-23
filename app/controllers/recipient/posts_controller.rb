class Recipient::PostsController < ApplicationController
  def index
    @posts = Post.where(status: '公開')
  end

  def show
    @post = Post.find(params[:id])
    @contributor = @post.contributor
    @recipient = current_recipient
  end

  def search
    @posts = Post.search(params[:title], params[:prefecture], params[:genre])
    render :index
  end
end
