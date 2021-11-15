class Recipient::RecipientsController < ApplicationController
  def show
    @recipient = current_recipient
    @rooms = @recipient.rooms
  end

  def edit
    @recipient = current_recipient
  end

  def update
    @recipient = current_recipient
    if @recipient.update(recipient_params)
      redirect_to recipients_path
    else
      render :edit
    end
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :email, :organization_name, :organization_url)
  end
end
