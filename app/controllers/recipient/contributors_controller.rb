class Recipient::ContributorsController < ApplicationController
  def show
    @contributor = Contributor.find(params[:id])
    @recipient = current_recipient
    @posts = @contributor.posts.where(status: '公開')
  end
end
