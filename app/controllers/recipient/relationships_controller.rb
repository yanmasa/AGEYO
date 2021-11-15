class Recipient::RelationshipsController < ApplicationController

  def create
    @recipient = current_recipient
    @recipient.follow(params[:contributor_id])
    redirect_to request.referer
  end

  def destroy
    @recipient = current_recipient
    @recipient.unfollow(params[:contributor_id])
    redirect_to request.referer
  end

  def followers
    @contributor = Contributor.find(params[:contributor_id])
    @recipients = @contributor.followers
  end

  def follows
    @recipient = current_recipient
    @contributors = @recipient.followings
  end
end
