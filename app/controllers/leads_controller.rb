class LeadsController < ApplicationController
  authorize_resource
  #before_filter :authenticate_user!
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  #skip_before_filter :authenticate_user!, only: [:create]
  skip_before_filter :verify_authenticity_token, :only => [:create]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      ACCMailer.lead_mail(@lead).deliver
      @success = true
      @message = "Hemos recibido tu solicitud de registro. En breve nos pondremos en contacto contigo."
      #format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
      #format.json { render :show, status: :created, location: @lead }
    else
      @success = false
      @message = "Ocurrió un error con tu solicitud de registro. Favor intentar nuevamente."
      #format.html { render :new }
      #format.json { render json: @lead.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:document_type, :document_id, :first_name, :last_name_f, :last_name_m, :phone_number, :email, :plate_number)
    end
end
