class ContactUsMessagesController < ApplicationController
  
  require 'contact_us_messages_mailer'
  
  # GET /contact_us_messages/new
  def new
    
  end
  
  # Handels creating the message to send to our email
  def create
    #render text: params[:contact_us_message].inspect
    # name, from_email, subject, message
    #ContactUsMessagesMailer.send_message(params[:contact_us_message][:name].to_s, 
    #params[:contact_us_message][:email].to_s, params[:contact_us_message][:subject].to_s, params[:contact_us_message][:message].to_s ).deliver
    
    #ActionMailer::Base.mail(to: 'skendri1@my.westga.edu', 
    #from: 'stephen.c.kendrick@gmail.com', subject: params[:contact_us_message][:subject].to_s, body: params[:contact_us_message][:message].to_s).deliver
    
    redirect_to '/contact_us_messages/new'
  end
  
end
