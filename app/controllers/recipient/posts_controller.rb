class Recipient::PostsController < ApplicationController
  def index
    @posts = Post.where(status: '公開').order(updated_at: :desc).page(params[:page]).per(15)
  end

  def show
    @post = Post.find(params[:id])
    @contributor = @post.contributor
    @recipient = current_recipient
  end

  def search
    @posts = Post.search(params[:name],params[:title], params[:prefecture], params[:genre]).page(params[:page]).per(15)
    render :index
  end
end
