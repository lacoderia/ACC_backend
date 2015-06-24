class InsuranceLeadsController < ApplicationController
  authorize_resource
  #before_filter :authenticate_user!
  before_action :set_insurance_lead, only: [:show, :edit, :update, :destroy]
  #skip_before_filter :authenticate_user!, only: [:create]
  skip_before_filter :verify_authenticity_token, :only => [:create]

  # GET /insurance_leads
  # GET /insurance_leads.json
  def index
    @insurance_leads = InsuranceLead.all
  end

  # GET /insurance_leads/1
  # GET /insurance_leads/1.json
  def show
  end

  # GET /insurance_leads/new
  def new
    @insurance_lead = InsuranceLead.new
  end

  # GET /insurance_leads/1/edit
  def edit
  end

  # POST /insurance_leads
  # POST /insurance_leads.json
  def create
    @insurance_lead = InsuranceLead.new(insurance_lead_params)
    if @insurance_lead.save
      ACCMailer.insurance_lead_mail(@insurance_lead).deliver
      @success = true
      @message = 'Hemos recibido tu solicitud de seguros. En breve nos pondremos en contacto contigo.'
      #format.html { redirect_to @insurance_lead, notice: 'InsuranceLead was successfully created.' }
      #format.json { render :show, status: :created, location: @insurance_lead }
    else
      @success = false
      @message = "Ocurrió un error con tu solicitud de seguros. Favor intentar nuevamente."
      #format.html { render :new }
      #format.json { render json: @insurance_lead.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /insurance_leads/1
  # PATCH/PUT /insurance_leads/1.json
  def update
    respond_to do |format|
      if @insurance_lead.update(insurance_lead_params)
        format.html { redirect_to @insurance_lead, notice: 'InsuranceLead was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_lead }
      else
        format.html { render :edit }
        format.json { render json: @insurance_lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_leads/1
  # DELETE /insurance_leads/1.json
  def destroy
    @insurance_lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'InsuranceLead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_lead
      @insurance_lead = InsuranceLead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_lead_params
      params.require(:insurance_lead).permit(:first_name, :last_name_f, :last_name_m, :phone_number, :email, :insurance_type, :other_type)
    end
end

