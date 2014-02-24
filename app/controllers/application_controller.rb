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

    helper_method :admin?
    protected
    def admin?
      if ( current_user && current_user.account_type == "ADMIN" )
        true
      else
        false
      end

    end

  	def authorize
    	unless poimgr? || admin?
      		redirect_to "/"
      		false
    	end
  	end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

  def get_user(user_id)
    user = User.find(user_id)
    return user
  end
  helper_method :get_user

  def get_picture(picture_id)
    picture = Picture.find(picture_id)
    return picture
  end
  helper_method :get_picture

end
