class ContactUsMessagesController < ApplicationController
  
  require 'contact_us_messages_mailer'
  
  # GET /contact_us_messages/new
  def new
    
  end
  
  # Handels creating the message to send to our email
  def create
    # The following is for now, until I get the mailer class working
    
    subject_text = params[:contact_us_message][:subject].to_s + " FROM: " + params[:contact_us_message][:name].to_s
    body_text = params[:contact_us_message][:message].to_s + " EMAIL: " + params[:contact_us_message][:email].to_s
    
    ActionMailer::Base.mail(from: 'noreplypoint@gmail.com', to: 'noreplypoint@gmail.com', subject: subject_text.to_s, body: body_text.to_s ).deliver
    #from: 'stephen.c.kendrick@gmail.com', subject: params[:contact_us_message][:subject].to_s, body: params[:contact_us_message][:message].to_s).deliver
    
    #ContactUsMessagesMailer.message(params[:contact_us_message][:name].to_s, params[:contact_us_message][:email].to_s, params[:contact_us_message][:subject].to_s, params[:contact_us_message][:message].to_s).deliver
    
    redirect_to '/contact_us_messages/confirmation'
  end
  
  # GET /contact_us_messages/confirmation
  def confirmation
    
  end
  
end
