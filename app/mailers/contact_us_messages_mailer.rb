#
class ContactUsMessagesMailer < ActionMailer::Base
  
  default from: 'skendri1@my.westga.edu'
  
  # Sends an email to our email from their given email
  #
  # Precondition: none
  #
  # Postcondition: none
  #
  def send_message(name, email, subject, message)
    body = subject.to_s + " " + message.to_s + " " + email.to_s
    mail(to: 'skendri1@my.westga.edu', subject: subject.to_s, body: body.to_s)
  end
  
end 