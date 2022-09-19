class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users 
  def index
    @users = User.all
  end

  # GET /users/1 
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @address = Address.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users 

  def create
    @user = User.new(user_params)
    respond_to do |format|
     
      if @user.save
        @address = Address.create({
                city: params[:user][:address][:city] ,
                country: params[:user][:address][:country] ,
                pin_code: params[:user][:address][:pin_code] ,
                state: params[:user][:address][:state] ,
                district: params[:user][:address][:district] ,
                user_id: @user.id 
              })

        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search_address
  
    @address = Address.where("city LIKE ? OR country LIKE ? OR district LIKE ? OR state LIKE ? ", "%#{params[:address]}%","%#{params[:address]}%","%#{params[:address]}%","%#{params[:address]}%" )
    
    respond_to do |format|
      format.js 
      format.html 
    end
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :phone , :address => [])
    end

    def address_params
      params.require(:user).permit(:address)
    end 

   

end
