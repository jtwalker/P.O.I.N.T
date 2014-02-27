class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	helper_method :poimgr?  
  	
  	protected
  	def poimgr?
    	if ( current_user && (current_user.account_type == "POIMGR" || current_user.account_type == "ADMIN") )
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

  def get_poi_rating(point_of_interest_id)
    total_rating_value = 0
    rating_avg = 0
    poi = PointOfInterest.find(point_of_interest_id)

    counter = 0
    Rating.where(point_of_interest_id: poi.id).each do |rating|
      current_rating_value = rating.rating
      total_rating_value = (total_rating_value + current_rating_value)
      counter = counter + 1
    end

    if (counter == 0)
      return 0
    end

    rating_avg = (total_rating_value/counter)

    return rating_avg
  end
  helper_method :get_poi_rating

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?

end
