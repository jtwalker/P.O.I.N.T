class ContactUsMessagesController < ApplicationController
  
  #require 'contact_us_messages_mailer'
  
  # GET /contact_us_messages/new
  def new
  end
  
  # Handels creating the message to send to our email
  def create

    if (params[:contact_us_message][:name].blank? || params[:contact_us_message][:email].blank? || params[:contact_us_message][:subject].blank? || params[:contact_us_message][:message].blank?)
      flash[:alert] = "Please fill out all form areas"
    else

      ContactUsMailer.send_message(params[:contact_us_message][:name].to_s, params[:contact_us_message][:email].to_s, params[:contact_us_message][:subject].to_s, params[:contact_us_message][:message].to_s).deliver
      flash[:notice] = "Message was sent. Thank you, we will try to reply in a timely manner."
    end

    redirect_to '/contact_us_messages/new'

  end
  
end
