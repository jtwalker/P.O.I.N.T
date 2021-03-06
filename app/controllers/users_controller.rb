class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if ( current_user == nil || admin? == false)
      flash[:alert] = "You are not allowed there."
      redirect_to root_url
    end

    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
     @user = User.find(params[:id])

     if ( @user == nil || current_user == nil || (@user.id != current_user.id && admin? == false ) )
      flash[:alert] = "You are not allowed there."
      redirect_to root_url
     end
  end

  # GET /users/new
  def new
    if ( current_user == nil || admin? == false )
      redirect_to root_url
    end
    
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
    if ( @user == nil || current_user == nil || admin? == false )
      flash[:alert] = "You are not allowed there."
      redirect_to root_url
    end

    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

    if (current_user == nil || admin? == false)
      redirect_to root_url
    end

    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:external_user_id, :provider, :account_type, :name, :email)
    end
end
