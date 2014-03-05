class AdminController < ApplicationController

	def index

		if ( current_user == nil || admin? == false)
			redirect_to root_url
		end

		@acrs = AccountChangeRequest.all
		@ppus = PendingPictureUpload.all
	end

	def accept_account_change_request

		if ( current_user == nil || admin? == false)
			redirect_to root_url
		end

		acr = AccountChangeRequest.find(params[:acr])
		user = get_user(acr.user_id)
		previous_account_type = user.account_type

		if user.update(account_type: acr.account_type)
			flash[:notice] = 'User was successfully updated to account type: ' + acr.account_type
			AccountTypeChangeMailer.send_accepted_account_change_request_message(user, previous_account_type, user.account_type).deliver
			acr.destroy
		else
			flash[:alert] = 'User was not updated to account type: ' + acr.account_type
		end

		redirect_to action: "index"

	end

	def deny_account_change_request

		if ( current_user == nil || admin? == false)
			redirect_to root_url
		end
		
		acr = AccountChangeRequest.find(params[:acr])
		user = get_user(acr.user_id)

		if acr.destroy
			flash[:notice] = 'Account change denied'
			AccountTypeChangeMailer.send_denied_account_change_request_message(user, user.account_type, acr.account_type).deliver
		else 
			flash[:alert] = 'Could not deny account change'
		end

		redirect_to action: "index"
		
	end

	#Pending Picture Handlers

	# If accepted, the ppu will be destroyed only. That means that the picture stays in the db
	def accept_pending_picture_upload

		if ( current_user == nil || admin? == false)
			redirect_to root_url
		end

		ppu = PendingPictureUpload.find(params[:ppu])

		if ppu.destroy
			flash[:notice] = 'Picture was successfully allowed'
			ppu.destroy
		else
			flash[:alert] = 'Picture was not accepted properly'
		end

		redirect_to action: "index"

	end

	# If denied, the ppu and picture will be destroyed.
	def deny_pending_picture_upload
		
		if ( current_user == nil || admin? == false)
			redirect_to root_url
		end

		ppu = PendingPictureUpload.find(params[:ppu])
		picture = get_picture(ppu.picture_id)

		if ( ppu.destroy && picture.destroy )
			flash[:notice] = 'Pending Picture Upload denied'
		else 
			flash[:notice] = 'Could not deny pending picture'
		end

		redirect_to action: "index"
		
	end

end
