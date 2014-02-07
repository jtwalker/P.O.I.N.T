class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception


  	helper_method :poimgr?  
  	
  	protected
  	def poimgr?
    	if ( current_user && (current_user.account_type == "POIMGR" || current_user.account_type == "admin") )
    		true
    	else
    		false
    	end

  	end

  	def authorize
    	unless poimgr?
      		redirect_to "/"
      		false
    	end
  	end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

end
