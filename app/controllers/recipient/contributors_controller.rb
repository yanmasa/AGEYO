class Recipient::ContributorsController < ApplicationController
  def show
    @contributor = Contributor.find(params[:id])
    @posts = @contributor.posts.where(status: '公開')
  end
end
