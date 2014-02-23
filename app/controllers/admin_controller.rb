class AdminController < ApplicationController

	def index
		@acrs = AccountChangeRequest.all
		@ppus = PendingPictureUpload.all
	end

	def accept_account_change_request
		acr = AccountChangeRequest.find(params[:acr])
		user = get_user(acr.user_id)
		previous_account_type = user.account_type

		if user.update(account_type: acr.account_type)
			flash[:notice] = 'User was successfully updated to account type: ' + acr.account_type
			AccountTypeChangeMailer.send_accepted_account_change_request_message(user, previous_account_type, user.account_type).deliver
		else
			flash[:alert] = 'User was not updated to account type: ' + acr.account_type
		end

		acr.destroy

		redirect_to action: "index"

	end

	def deny_account_change_request
		
		acr = AccountChangeRequest.find(params[:acr])
		user = get_user(acr.user_id)

		if acr.destroy
			flash[:notice] = 'Account change denied'
			AccountTypeChangeMailer.send_denied_account_change_request_message(user, user.account_type, acr.account_type).deliver
		else 
			flash[:notice] = 'Could not deny account change'
		end

		redirect_to action: "index"
		
	end

	#Pending Picture Handlers

	def accept_pending_picture_upload
		ppu = PendingPictureUpload.find(params[:ppu])
		picture = get_picture(ppu.picture_id)

		if picture.update(is_allowed: true)
			flash[:notice] = 'Picture was successfully allowed'
		else
			flash[:alert] = 'Picture was not accepted properly'
		end

		ppu.destroy

		redirect_to action: "index"

	end

	def deny_pending_picture_upload
		
		ppu = PendingPictureUpload.find(params[:ppu])
		picture = get_picture(ppu.picture_id)

		if ppu.destroy
			flash[:notice] = 'Pending Picture Upload denied'
		else 
			flash[:notice] = 'Could not deny pending picture'
		end

		redirect_to action: "index"
		
	end

end
