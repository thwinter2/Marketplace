class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :checkout, :purchase, :process_purchase, :clear]
  before_action :reroute_visitor, except: []
  before_action :generate_otp, only: [:checkout]
  # before_action :hide_other_user_carts, except: [:index]

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
    @cart = Cart.new(cart_params)

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

  def clear
    CartItem.where(cart_id: @cart).delete_all
    respond_to do |format|
      format.html { redirect_to @cart, notice: 'Cart was successfully cleared.' }
      format.json { head :no_content }
      end
  end

  def checkout
    totp = ROTP::TOTP.new("base32secret3232", issuer: "My Service")
    if params[:commit] == "Submit"
      if totp.verify(params[:otp], drift_behind: 300)
        redirect_to purchase_path, notice: 'Successful password verification'
      else
        redirect_to checkout_path, notice: 'Unsuccessful password verification'
      end
    else
      UserMailer.otp_email(current_user.email, @otp).deliver_later
      end
  end

  def purchase
    if params[:commit] == "Add Credit Card"
      current_user.create_new_credit_card()
    else
      @items = CartItem.where(cart_id: @cart.id)
    end
  end

  def process_purchase
    if params[:cvv].to_s == CreditCard.find_by(card_num: params[:number]).card_cvv.to_s
      notice = @cart.buy_items
      UserMailer.with(user: current_user, cart: @cart).purchase_email(current_user.email, @cart).deliver_later
      @cart.clear
      redirect_to items_path, notice: notice == '' ? 'Thank you for your purchase! Check your email for your confirmation.' : notice.to_s
    else
      redirect_to purchase_path, notice: 'The CVV provided did not match the one on file. Please try again or update your information'
    end
    # Email user
    # Update purchase history
  end


  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :item_id, :quantity, :tax_slab, :price, :otp)
    end

    def generate_otp
      totp = ROTP::TOTP.new("base32secret3232", issuer: "My Service")
      @otp = totp.now
    end

    # def hide_other_user_carts
    #   redirect_to carts_url unless current_user.admin? or @cart.user_id.equal?(current_user.id)
    # end
end
