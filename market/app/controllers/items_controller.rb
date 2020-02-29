class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :reroute_visitor_and_regular_user, except: [:index, :show, :buy_now, :verify_otp, :subscribe_to_availability]

  # GET /items
  # GET /items.json
  def index
    if params[:order_by]
      @items = Item.all.order(params[:order_by])
    elsif params[:search_category]
      @items = Item.search_category(params[:search_category])
    elsif params[:search_brand]
      @items = Item.search_brand(params[:search_brand])
    elsif params[:search_availability]
      @items = Item.search_availability(params[:search_availability])
    else
      @items = Item.all
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @popularity = @item.views_count
    if @popularity.nil?
      @popularity = 0
    end
    @popularity += 1
    @item.views_count = @popularity
    @item.save
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    item = Item.find(params[:id])
    if item.quantity > 0
      @subscribed_users = SubscribedUser.where(item_id: item.id)
      @subscribed_users.each do |items|
        puts 'HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH'
        items.destroy
        puts 'HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH'
      end
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.views_count = 0

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    puts params[:item]
    if params[:item][:quantity].to_i > 0
      SubscribedUser.where(item_id: params[:id]).each do |subscribed_user|
        puts 'TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT'
        user = User.find(subscribed_user.user_id)
        puts user.name
        puts 'TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT'
        UserMailer.with(user: user, item: Item.find(params[:id])).availability_email(user.email).deliver_now
        subscribed_user.destroy
      end
    end


    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # One click Buy Now option
  def buy_now
    respond_to do |format|
      puts("testing .............")
      otp = rand(10 ** 9...10 ** 10).to_s
      # User.find(current_user.id)[:otp] = otp
      puts("*******************************")
      # puts(User.find(current_user.id).otp)
      UserMailer.with(item: @item).otp_email(current_user.email, otp).deliver_later
      format.html { redirect_to buy_now, notice: 'One Time Password emailed.' }
      break
      # format.json { render :new }
    end
  end

  # Verify otp (PUT operation)
  def verify_otp
    respond_to do |format|
      if params[:otp]
        PurchaseHistory.create(@item)
        format.html { redirect_to purchase_histories_url, notice: 'Item was successfully purchased.' }
        format.json { head :no_content }
      end
    # original_otp = User.find(current_user.id).email
    # respond_to do |format|
    end
  end

  def subscribe_to_availability
    @subscribed_user = SubscribedUser.new(item_id: params[:item_id], user_id: current_user.id)
    if @subscribed_user.save
      redirect_to items_path, notice: 'You will receive an email when this item is back in stock'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:unique_id, :name, :brand, :category, :description, :image, :special_item, :age_restricted, :quantity, :cost, :tax_slab, :views_count, :search_category, :search_brand, :search_availability)
    end
end
