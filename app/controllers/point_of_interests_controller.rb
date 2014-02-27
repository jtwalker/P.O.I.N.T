class PointOfInterestsController < ApplicationController
	
	before_filter :authorize, :except => [:index, :show ]

	#GET /point_of_interest/new
	def new
		@poi = PointOfInterest.new
	end

	#Index that shows all the POIs in the system in a table. Will remove or block from all users later.
	def index
		@pois = PointOfInterest.all
	end

	# Handles creating the POI
	def create
		#render text: params[:point_of_interest].inspect

		@poi = PointOfInterest.new(post_params)
		@poi.user_id = current_user.id

		if ( @poi.save )
			@picture = Picture.new
			@picture.photo = params[:point_of_interest][:photo]
			@picture.user_id = current_user.id
			@picture.main_image = true

			@picture.point_of_interest_id = @poi.id

			
			#Test
			params[:point_of_interest][:photoarrays].each do |image|
			  @document = Picture.new
			  @document.photo = image
			  @document.user_id = current_user.id
			  @document.main_image = false
			  @document.point_of_interest_id = @poi.id
			  @document.save
			end

			if (@picture.save)
    			redirect_to @poi
    		else

    			@poi.destroy
    			render 'new'
    		end
  		else
    		render 'new'
  		end
	end

	# GET /point_of_interest/:id(.:format) point_of_interests@show
	def show
		@poi = PointOfInterest.find(params[:id])
	end

	def edit
  		@poi = PointOfInterest.find(params[:id])
	end

	#Updates the POI
	def update
  		@poi = PointOfInterest.find(params[:id])
 
  		if @poi.update(params[:point_of_interest].permit(:latitude, :longitude, :summary, :sponsor_info, :artist_info))
    		redirect_to @poi
  		else
    		render 'edit'
  		end
	end

	# Destroys the POI
	def destroy
  		@poi = PointOfInterest.find(params[:id])
  		@poi.destroy
 
  		redirect_to point_of_interests_path
	end

	def directions
		@poi = PointOfInterest.find(params[:id])
	end

	private
  	def post_params
    	params.require(:point_of_interest).permit(:latitude, :longitude, :summary, :sponsor_info, :artist_info)
  	end
end
