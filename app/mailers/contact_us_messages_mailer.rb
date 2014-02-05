#Class that handles the ContactUs mailer
class ContactUsMessagesMailer < ActionMailer::Base
  
  default from: 'noreplypoint@gmail.com'
  
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
    
    mail(to: 'noreplypoint@gmail.com', subject: @subject.to_s)
  end
  
end 