class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :reroute_visitor, except: []
  before_action :hide_other_users, except: [:index]
  before_action :set_cart, only: [:new, :create]
  
  # GET /users
  # GET /users.json
  def index

    if current_user.admin?
      @users = User.all
    else
      @users = User.select{|person| person.id.equal?(current_user.id)}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_session_path(email: 'market5172020@gmail.com', password: 'password'), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if !@user.admin?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'An Admin cannot be destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :dob, :street_addres, :city, :state, :zip, :card_name, :cart, :wishlist, :otp)
    end

    def hide_other_users
      redirect_to users_url unless current_user.admin? or @user.id.equal?(current_user.id)
    end
end
