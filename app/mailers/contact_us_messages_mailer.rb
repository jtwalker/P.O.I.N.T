#Class that handles the ContactUs mailer
class ContactUsMessagesMailer < ActionMailer::Base
  
  default from: 'stephen.c.kendrick@gmail.com'
  
  # Sends an email to our email from their given email
  #
  # Precondition: none
  #
  # Postcondition: none
  #
  def message(name, email, subject, message)
    @name = name.to_s
    @email = email.to_s
    @subject = subject.to_s + " FROM: " + @name.to_s
    @message = message.to_s
    
    mail(to: 'skendri1@my.westga.edu', subject: @subject.to_s)
  end
  
end 