class RoadsideAssistancesController < ApplicationController
  authorize_resource
  #before_filter :authenticate_user!
  before_action :set_roadside_assistance, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  #skip_before_filter :authenticate_user!, only: [:create, :solved]

  # GET /roadside_assistances
  # GET /roadside_assistances.json
  def index
    @roadside_assistances = RoadsideAssistance.all
  end

  # GET /roadside_assistances/1
  # GET /roadside_assistances/1.json
  def show
  end

  # GET /roadside_assistances/new
  def new
    @roadside_assistance = RoadsideAssistance.new
  end

  # GET /roadside_assistances/1/edit
  def edit
  end

  # POST /roadside_assistances
  # POST /roadside_assistances.json
  def create
    @roadside_assistance = RoadsideAssistance.new(roadside_assistance_params)

    if @roadside_assistance.save
      @success = true
      @message = 'Hemos recibido tu solicitud. En breve nos pondremos en contacto contigo.'
    else
      @success = false
      @message = 'Ocurrió un error con tu solicitud. Favor intentar nuevamente.'
    end
  end

  # PATCH/PUT /roadside_assistances/1
  # PATCH/PUT /roadside_assistances/1.json
  def update
    respond_to do |format|
      if @roadside_assistance.update(roadside_assistance_params)
        format.html { redirect_to @roadside_assistance, notice: 'Roadside assistance was successfully updated.' }
        format.json { render :show, status: :ok, location: @roadside_assistance }
      else
        format.html { render :edit }
        format.json { render json: @roadside_assistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roadside_assistances/1
  # DELETE /roadside_assistances/1.json
  def destroy
    @roadside_assistance.destroy
    respond_to do |format|
      format.html { redirect_to roadside_assistances_url, notice: 'Roadside assistance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def solved
    ra = RoadsideAssistance.find(params[:id])
    if ra
      ra.update_attribute(:solved, params[:solved])
      render json: {:roadside_assitance => ra}
      return
    else
      render plain: "Error", status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roadside_assistance
      @roadside_assistance = RoadsideAssistance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roadside_assistance_params
      params.require(:roadside_assistance).permit(:name, :phone_number, :plate_number, :assistance_type, :lat, :long, :is_guest, :user_id, :solved)
    end
end
