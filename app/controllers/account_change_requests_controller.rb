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

		@acr = AccountChangeRequest.new(acr_params)
		@acr.user_id = current_user.id
		

		if ( @acr.save )
			flash[:notice] = "Account Change Request has been sent to the Admins"
    		redirect_to current_user
  		else
  			flash[:alert] = "Account Change Request could not be completed."
    		render 'new'
  		end
	end

	def destroy

		if ( current_user == nil || admin? == false)
			redirect_to root_url
		end

		@acr = AccountChangeRequest.find(params[:id])
    	@acr.destroy

    	respond_to do |format|
      		format.html { redirect_to root_url }
      		format.json { head :no_content }
    	end
	end

	private
  	def acr_params
    	params.require(:account_change_request).permit(:reason_message, :account_type)
  	end

end
