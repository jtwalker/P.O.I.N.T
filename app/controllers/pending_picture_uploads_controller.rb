class PendingPictureUploadsController < ApplicationController

	# Handles creating the Pending Picture Upload
	def create

		if ( current_user == nil)
			redirect_to root_url
		end

		@ppu = PendingPictureUpload.new
		@ppu.user_id = current_user.id
		@ppu.picture_id = params[:picture_id]
		

		if ( @ppu.save )
    		redirect_to root_url
  		else
    		render 'new'
  		end
	end

	def destroy

		if ( current_user == nil || admin? == false) 
			redirect_to root_url
		end

		@ppu = PendingPictureUpload.find(params[:ppu])
    	@ppu.destroy

    	respond_to do |format|
      		format.html { redirect_to root_url }
      		format.json { head :no_content }
    	end
	end

	private
  	def ppu_params
    	params.require(:account_change_request).permit(:picture, :user)
  	end

end
