class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def confirm
    @contact = Contact.new(contact_params)
  end
  
  def back
    @contact = Contact.new(contact_params)
    render :new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      redirect_to done_path
    else
      render :new
    end
  end
  
  def done
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :organization_name, :email, :phone_number, :subject, :content)
  end
  
end
