class PurchaseHistoriesController < ApplicationController
  before_action :set_purchase_history, only: [:show, :edit, :update, :destroy]
  before_action :reroute_visitor, except: []
  before_action :reroute_visitor_and_regular_user, only: [:requests]


  # GET /purchase_histories
  # GET /purchase_histories.json
  def index
    if current_user.admin?
      if !params[:item_search].nil?
        @purchase_histories = PurchaseHistory.where(item_id: params[:item_search])
      elsif !params[:user_search].nil?
        @purchase_histories = PurchaseHistory.where(user_id: params[:user_search])
      else
        @purchase_histories = PurchaseHistory.all
      end
      if @purchase_histories.size == 0
        @purchase_histories = PurchaseHistory.all
      end
    else
      @purchase_histories = PurchaseHistory.where(user_id: current_user.id)
    end
  end

  # GET /purchase_histories/1
  # GET /purchase_histories/1.json
  def show
  end

  # GET /purchase_histories/new
  def new
    @purchase_history = PurchaseHistory.new
  end

  # GET /purchase_histories/1/edit
  def edit
  end

  # POST /purchase_histories
  # POST /purchase_histories.json
  def create
    @purchase_history = PurchaseHistory.new(purchase_history_params)

    respond_to do |format|
      if @purchase_history.save
        puts("Purchase history saved ............... ")
        UserMailer.with(purchase_history: @purchase_history).purchase_email(current_user.email, purchase_history_params).deliver_later
        puts(purchase_history_params)
        puts("testing ............... ")
        format.html { redirect_to @purchase_history, notice: 'Purchase history was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_history }
      else
        format.html { render :new }
        format.json { render json: @purchase_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_histories/1
  # PATCH/PUT /purchase_histories/1.json
  def update
    respond_to do |format|
      if @purchase_history.update(purchase_history_params)
        format.html { redirect_to @purchase_history, notice: 'Purchase history was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_history }
      else
        format.html { render :edit }
        format.json { render json: @purchase_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_histories/1
  # DELETE /purchase_histories/1.json
  def destroy
    @purchase_history.destroy
    respond_to do |format|
      format.html { redirect_to purchase_histories_url, notice: 'Purchase history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def requests
    @purchase_histories = PurchaseHistory.where("status LIKE ?", "%" + 'Pending' + "%")
  end

  def return_requests
    purchase_history = PurchaseHistory.find(params[:purchase_history])
    purchase_history.return = 'Pending'
    purchase_history.status = 'Pending Return'
    purchase_history.save
    redirect_to purchase_histories_path, notice: 'Return has been requested. You will be contacted when an administrator makes a decision.'
  end

  def admin_response
    purchase_history = PurchaseHistory.find(params[:purchase_history])
    item = Item.find(purchase_history.item_id)
    puts params[:response]
    if params[:response] == true or params[:response] == 'true'
      puts 'Approved!'
      if purchase_history.status == 'Pending Approval'
        item.quantity -= purchase_history.quantity
        purchase_history.status = 'Purchased'
      else
        item.quantity += purchase_history.quantity
        purchase_history.status = 'Return Approved'
        purchase_history.return = 'Returned'
      end
    else
      puts 'Rejected'
      if purchase_history.status == 'Pending Approval'
        purchase_history.status = 'Rejected'
      else
        purchase_history.status = 'Return Rejected'
        purchase_history.return = 'Return Rejected'
      end
    end
    purchase_history.save
    item.save
    if purchase_history.status.include? 'Return'
      UserMailer.with(purchase_history: purchase_history, user: User.find(purchase_history.user_id)).return_request_email(User.find(purchase_history.user_id).email).deliver_later
    else
      UserMailer.with(purchase_history: purchase_history, user: User.find(purchase_history.user_id)).special_item_email(User.find(purchase_history.user_id).email).deliver_later
    end
    redirect_to requests_path, notice: 'You have responded to a request'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_history
      @purchase_history = PurchaseHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_history_params
      params.require(:purchase_history).permit(:user_id, :item_id, :status, :quantity, :item_search, :user_search)
    end
end
