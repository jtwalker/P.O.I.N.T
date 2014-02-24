class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new

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

    # This is only here to facilitate the creation of new Pictures since this attribute has to be filled in and I don't have 
    # the user fill it in.
    @picture.picture_id = 1

    #Create Pending Picture Data
    @ppu = PendingPictureUpload.new
    @ppu.user_id = current_user.id

    respond_to do |format|
      if @picture.save

        @ppu.picture_id = @picture.id

        if @ppu.save

          format.html { redirect_to @poi, notice: 'Picture was successfully created.' }
          format.json { render action: 'show', status: :created, location: @picture }
        
        end

      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
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
        format.html { render action: 'edit' }
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
