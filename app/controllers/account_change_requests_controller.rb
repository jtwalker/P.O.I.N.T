class AccountChangeRequestsController < ApplicationController

	#GET
	def new
		@acr = AccountChangeRequest.new
	end

	# Handles creating the Account Change Request
	def create

		if ( current_user == nil)
			redirect_to root_url
		end

		@acr = AccountChangeRequest.new(post_params)
		@acr.user_id = current_user.id
		

		if ( @acr.save )
    		redirect_to root_url
  		else
    		render 'new'
  		end
	end

	private
  	def post_params
    	params.require(:account_change_request).permit(:reason_message, :account_type)
  	end

end
