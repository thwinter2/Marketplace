class PurchaseHistoriesController < ApplicationController
  before_action :set_purchase_history, only: [:show, :edit, :update, :destroy]
  before_action :reroute_visitor, except: []


  # GET /purchase_histories
  # GET /purchase_histories.json
  def index
    @purchase_histories = PurchaseHistory.all
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
        puts("testing ............... ")
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_history
      @purchase_history = PurchaseHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_history_params
      params.fetch(:purchase_history, {})
    end
end
