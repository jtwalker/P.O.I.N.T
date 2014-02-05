class ContactUsMailer < ActionMailer::Base
  default from: "noreplypoint@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_us_mailer.send_message.subject
  #
  def send_message(name, email, subject, message)
    #@greeting = "Hi"

    #mail( to: "noreplypoint@gmail.com" )
    @name = name.to_s
    @email = email.to_s
    @subject = subject.to_s + " FROM: " + @name.to_s
    @message = message.to_s
    
    mail(to: 'noreplypoint@gmail.com', subject: @subject.to_s)
  end
end
