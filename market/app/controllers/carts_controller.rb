class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :reroute_visitor, except: []
  before_action :hide_other_user_carts, except: [:index]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where(user_id: current_user.id)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @carts = Cart.where(user_id: current_user.id)
    if @carts.any? and Cart.where(user_id: current_user.id).where(item_id: cart_params[:item_id]).take
      @cart = Cart.where(user_id: current_user.id).where(item_id: cart_params[:item_id]).take
      @cart.quantity = @cart.quantity += params[:quantity].to_i
    else
      @cart = Cart.new(cart_params)
      @cart.quantity = params[:quantity]
    end


    respond_to do |format|
      if @cart.save
        format.html { redirect_to items_path, notice: 'Successfully added to cart' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # # One click Buy Now option
  # def buy_now
  #   respond_to do |format|
  #     # UserMailer.with(1).otp_email.deliver_later
  #     puts("testing .............")
  #     format.html { redirect_to buy_now, notice: 'One Time Password emailed.' }
  #     break
  #     # format.json { render :new }
  #   end
  # end

  # # Verify otp
  # def verify_otp
  # end

  def clear
    Cart.where(user_id: current_user.id).delete_all
    flash[:notice] = 'You have cleared the cart!'
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find_by(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :item_id, :quantity, :tax_slab, :price)
    end

    def hide_other_user_carts
      redirect_to carts_url unless current_user.admin? or @cart.user_id.equal?(current_user.id)
    end
end
