class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]
  before_action :reroute_visitor, except: []
  before_action :hide_other_user_wishlists, except: [:index]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.where(user_id: current_user.id)
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @wishlists = Wishlist.where(user_id: current_user.id)
    if @wishlists.any? and Wishlist.where(user_id: current_user.id).where(item_id: wishlist_params[:item_id]).take
      flash[:notice] = 'Item already on wishlist!'
      redirect_to items_url
    else
      @wishlist = Wishlist.new(wishlist_params)

      respond_to do |format|
        if @wishlist.save
          # Tell the UserMailer to send a wishlist email after save
          UserMailer.with(wishlist: @wishlist).wishlist_email(current_user.email).deliver_later
          format.html { redirect_to wishlists_url, notice: 'Item successfully added to wishlist' }
          format.json { render :show, status: :created, location: @wishlist }
        else
          format.html { render :new }
          format.json { render json: @wishlist.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :item_id)
    end

    def hide_other_user_wishlists
      redirect_to wishlists_url unless current_user.admin? or @wishlist.user_id.equal?(current_user.id)
    end
end
