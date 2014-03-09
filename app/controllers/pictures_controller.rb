class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index

    if (current_user == nil || admin? == false)
      redirect_to root_url
    end

    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    if (current_user == nil || admin? == false)
      redirect_to root_url
    end
  end

  # GET /pictures/new
  def new

    if (current_user == nil )
      redirect_to root_url
    end

    @picture = Picture.new
    @poi = PointOfInterest.find(params[:poi])

  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)

    @poi = PointOfInterest.find(params[:picture][:point_of_interest_id])

    @picture.point_of_interest_id = @poi.id
    @picture.user_id = current_user.id
    @picture.main_image = false

    #Create Pending Picture Data
    @ppu = PendingPictureUpload.new
    @ppu.user_id = current_user.id

    if ( @picture.save )

      @ppu.picture_id = @picture.id

      if ( @ppu.save )

        flash[:notice] = "Picture was uploaded and is pending admin allowance."
        redirect_to @poi
        
      else 

        flash[:alert] = "Pending Picture Upload could not be created, Picture was deleted."
        @picture.destroy
        
      end

    else
      flash[:alert] = "Picture could not be saved."  
      redirect_to action: 'new'
    end
    
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to request.env['HTTP_REFERER'] }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to request.env['HTTP_REFERER'] }
      format.json { head :no_content }
    end
  end

  def make_main_image
      given_picture = Picture.find(params[:id])
      poi_id = given_picture.point_of_interest_id

      Picture.where(point_of_interest_id: poi_id).each do |picture|
          picture.update_attribute(:main_image, false)
      end

      given_picture.update_attribute(:main_image, true)

      respond_to do |format|
        format.html { redirect_to request.env['HTTP_REFERER'] }
        format.json { head :no_content }
      end
  end
  helper_method :make_main_image

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:photo, :user_id, :point_of_interest_id, :picture_id)
    end


end
