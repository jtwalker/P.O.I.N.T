class User < ActiveRecord::Base

	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :external_user_id)).first_or_initialize.tap do |user|
    	user.provider = auth.provider
    	user.external_user_id = auth.uid
    	user.name = auth.info.name
    	
    	if (user.account_type == nil)
    		user.account_type = "Standard"
    	end

    	user.save!
  	end
end

end
