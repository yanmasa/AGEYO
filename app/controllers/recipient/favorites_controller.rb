class Recipient::FavoritesController < ApplicationController

  def create
    current_recipient.favorites.create(post_id: params[:post_id])
    redirect_to request.referer
  end

  def destroy
    current_recipient.favorites.find_by(post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  def index
    @recipient = current_recipient
    @posts = @recipient.stocks
  end


end
