class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    params[:buy_now] = false
    if params[:commit] == "Buy Now"
      puts("88888888888888888*********** BUY NOW *****************8888888888888888888888")
      params[:buy_now] = true
      @cart.buy_now(params)
      if @cart.save
        redirect_to checkout_path
      end
    elsif params[:commit] == "Add to Cart"
      @cart.add_item(params)
      if @cart.save
        redirect_to cart_path(@cart.id)
      else
        redirect_to items_path
      end
    else
      redirect_to items_path
    end

  # def create
  #   params[:buy_now] = false
  #   if params[:commit] == "Buy Now"
  #       redirect_to checkout_path
  #     params[:buy_now] = true
  #     @cart.buy_now(params)
  #     if @cart.save

  #   else
  #     @cart.add_item(params)
  #   end
  #   if @cart.save
  #     if params[:commit] == "Add to Cart"
  #       redirect_to cart_path(@cart.id)
  #     elsif params[:commit] == "Buy Now"
  #       puts("88888888888888888888888888888888888*************************88888888888888888888888888888888888")
  #       if current_user.credit_cards.size == 0
  #         puts("...................... USER DOES NOT HAVE CREDIT CARD ...................")
  #       else
  #         puts("...................... USER HAS CREDIT CARD ...................")
  #       end
  #       redirect_to checkout_path
  #     else
  #       redirect_to items_path
  #     end
  #   else
  #     redirect_to items_path
  #   end


    # @cart_item = CartItem.new(cart_item_params)
    #
    # respond_to do |format|
    #   if @cart_item.save
    #     format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
    #     format.json { render :show, status: :created, location: @cart_item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @cart_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to @cart, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :cart_id, :quantity)
    end
end
