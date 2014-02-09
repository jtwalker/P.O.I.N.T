class AdminController < ApplicationController

	def index
		@acrs = AccountChangeRequest.all
	end

	def accept_account_change_request(acr)
		user = get_user(acr.user_id)

	end

	def deny_account_change_request
		
	end

end
