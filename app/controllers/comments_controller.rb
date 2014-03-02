class CommentsController < ApplicationController
	
	def create

		if ( current_user == nil)
			redirect_to root_url
		end

    	@poi = PointOfInterest.find(params[:point_of_interest_id])
    	@comment = @poi.comments.create(params[:comment].permit(:body, :user_id))

    	redirect_to point_of_interest_path(@poi)
  	end

  	def destroy

  		if ( current_user == nil )
			redirect_to root_url
		end
	    
	    @comment = Comment.find(params[:id])
	    @poi = PointOfInterest.find(@comment.point_of_interest_id)

	    @comment.destroy
	    
	    redirect_to point_of_interest_path(@poi)
  	end

end
