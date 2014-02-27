class RatingsController < ApplicationController

	def create
		@poi = PointOfInterest.find(params[:rating][:point_of_interest_id])
		if (current_user == nil || @poi == nil)
			redirect_to root_url
		end

		@rating = Rating.new(rating_params)

		@rating.user_id = current_user.id
		@rating.point_of_interest_id = @poi.id

		if (@rating.save)
			flash[:notice] = 'You gave this POI a rating of ' + @rating.rating.to_s + '!'
			redirect_to @poi
		else
			flash[:alert] = 'Rating for POI: ' + @poi.id.to_s + ' was not created'
			redirect_to @poi
		end

	end

	def destroy
		@rating = Rating.find(params[:id])

		@poi = PointOfInterest.find(@rating.point_of_interest_id)

		@rating.destroy

		flash[:notice] = 'Rating was destroyed successfully'
		redirect_to @poi
	end

	private

	def rating_params
		params.require(:rating).permit(:rating, :point_of_interest_id)
	end

end
