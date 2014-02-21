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
		
		# Early attempts at creating the picture at the same time as the POI. This is actually the way I've seen most recommended but I'm apparently I'm missing something here.
		#params = { point: {latitude: :latitude, longitude: :longitude, summary: :summary, artist_info: :artist_info, sponsor_info: :sponsor_info, picture_attributes: {photo: :photo, user: current_user.id, poi: :id}}}
    #@poi = PointOfInterest.new(params[:point])

		@poi = PointOfInterest.new(post_params)
		@poi.user_id = current_user.id
		# This one will say that it cannot find the @poi.id and that is because the POI doesn't exist yet. You will have to save before doing this one.
		# This is the one giving the picture_id error.
		# pic = Picture.create(attributes = {:user => User.find(current_user.id), photo: :photo, :poi => PointOfInterest.find(@poi.id)})
		

		if ( @poi.save )
    		redirect_to @poi
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

	private
  	def post_params
    	params.require(:point_of_interest).permit(:latitude, :longitude, :summary, :sponsor_info, :artist_info)
  	end

end
