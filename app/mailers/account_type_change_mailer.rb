class AccountTypeChangeMailer < ActionMailer::Base
  default from: "noreplypoint@gmail.com"

  def send_accepted_account_change_request_message(user, previous_account_type, new_account_type)
    
    @user = user

    @previous_account_type = previous_account_type.to_s
    @new_account_type = new_account_type.to_s 

    @subject = "POINT - Account Type Change Request - Accepted"
    
    mail(to: @user.email, subject: @subject.to_s)
  end

  def send_denied_account_change_request_message(user, current_account_type, wanted_account_type)
    
    @user = user

    @current_account_type = current_account_type.to_s
    @wanted_account_type = wanted_account_type.to_s 

    @subject = "POINT - Account Type Change Request - Denied"
    
    mail(to: @user.email, subject: @subject.to_s)
  end


end
