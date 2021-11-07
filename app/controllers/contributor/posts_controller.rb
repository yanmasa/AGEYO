class Contributor::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.contributor_id = current_contributor.id
    @post.save
    redirect_to contributor_post_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
    @genres = PostGenre.all
  end

  def index
    @contributor = current_contributor
    @posts = @contributor.posts.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post = Post.update(post_params)
      redirect_to contributor_post_path(@post)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:post_genre_id, :content, :post_image, :status, :prefecture)
  end

end
