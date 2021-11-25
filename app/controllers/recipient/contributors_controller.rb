class Recipient::ContributorsController < ApplicationController
  def show
    @contributor = Contributor.find(params[:id])
    @recipient = current_recipient
    @posts = @contributor.posts.where(status: '公開').order(updated_at: :desc).page(params[:page]).per(15)
  end
end
