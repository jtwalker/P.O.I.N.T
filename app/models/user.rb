class User < ActiveRecord::Base
    has_many :pointofinterests, :class_name => 'PointOfInterest', dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
    has_many :accountchangerequests, :class_name => 'AccountChangeRequest', dependent: :destroy
    has_many :pendingpictureuploads, :class_name => 'PendingPictureUpload', dependent: :destroy

    validates_presence_of :uid, :provider, :account_type, :name, :email

	def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        	user.provider = auth.provider
        	user.uid = auth.uid
        	user.name = auth.info.name
            user.email = auth.info.email
            user.oauth_token = auth.credentials.oauth_token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        	
        	if (user.account_type == nil)
        		user.account_type = "Standard"
        	end

            if (auth.info.email == "noreplypoint@gmail.com")
                user.account_type = "ADMIN"
            end

        	user.save!
  	end
end

end
