class Recipient::RequestsController < ApplicationController
  def create
    current_recipient.requests.create(post_id: params[:post_id])
    redirect_to request.referer
  end
end
