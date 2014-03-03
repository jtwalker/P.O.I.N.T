class ContactUsMessagesController < ApplicationController
  
  #require 'contact_us_messages_mailer'
  
  # GET /contact_us_messages/new
  def new
  end
  
  # Handels creating the message to send to our email
  def create
    ContactUsMailer.send_message(params[:contact_us_message][:name].to_s, params[:contact_us_message][:email].to_s, params[:contact_us_message][:subject].to_s, params[:contact_us_message][:message].to_s).deliver
    flash[:notice] = "Message was sent. Thank you, we will try to reply in a timely manner."
    redirect_to '/contact_us_messages/new'
  end
  
end
