class AdminController < ApplicationController

	def index
		@acrs = AccountChangeRequest.all
	end

	def accept_account_change_request
		acr = AccountChangeRequest.find(params[:acr])
		user = get_user(acr.user_id)

		if user.update(account_type: acr.account_type)
			flash[:notice] = 'User was successfully updated to account type: ' + acr.account_type
		else
			flash[:alert] = 'User was not updated to account type: ' + acr.account_type
		end

		acr.destroy

		redirect_to action: "index"

	end

	def deny_account_change_request
		
		acr = AccountChangeRequest.find(params[:acr])

		if acr.destroy
			flash[:notice] = 'Account change denied'
		else 
			flash[:notice] = 'Could not deny account change'
		end

		redirect_to action: "index"
		
	end

end
