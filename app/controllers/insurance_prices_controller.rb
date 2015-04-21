class InsurancePricesController < ApplicationController
  before_action :set_insurance_price, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /insurance_prices
  # GET /insurance_prices.json
  def index
    @insurance_prices = InsurancePrice.all
  end

  # GET /insurance_prices/1
  # GET /insurance_prices/1.json
  def show
  end

  # GET /insurance_prices/new
  def new
    @insurance_price = InsurancePrice.new
  end

  # GET /insurance_prices/1/edit
  def edit
  end

  # POST /insurance_prices
  # POST /insurance_prices.json
  def create
    @insurance_price = InsurancePrice.new(insurance_price_params)
    if @insurance_price.save
      @success = true
      @message = "Hemos recibido tu solicitud de contratación de seguro. En breve nos pondremos en contacto contigo."
      #format.html { redirect_to @insurance_price, notice: 'InsurancePrice was successfully created.' }
      #format.json { render :show, status: :created, location: @insurance_price }
    else
      @success = false
      @message = "Ocurrió un error con tu solicitud de contratación de seguro. Intenta nuevamente."
      #format.html { render :new }
      #format.json { render json: @insurance_price.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /insurance_prices/1
  # PATCH/PUT /insurance_prices/1.json
  def update
    respond_to do |format|
      if @insurance_price.update(insurance_price_params)
        format.html { redirect_to @insurance_price, notice: 'InsurancePrice was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_price }
      else
        format.html { render :edit }
        format.json { render json: @insurance_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_prices/1
  # DELETE /insurance_prices/1.json
  def destroy
    @insurance_price.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'InsurancePrice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def table
		@insurance_prices = InsurancePrice.all  	
  end

  private
  	 # Use callbacks to share common setup or constraints between actions.
    def set_insurance_price
      @insurance_price = InsurancePrice.find(params[:id])
    end

    def insurance_price_params
      params.require(:insurance_price).permit(:vehicle_type, :size, :ageold, :price)
    end
end

