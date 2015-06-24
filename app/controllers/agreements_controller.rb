class AgreementsController < ApplicationController
  authorize_resource
  #before_filter :authenticate_user!
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  #skip_before_filter :authenticate_user!, only: [:index, :active]

  # GET /agreements
  # GET /agreements.json
  def index
    if (params[:min] == "true")
      @agreements = Agreement.where("active = ?", true)
      render :partial => 'show_custom', :content_type => 'application/json'
    end
    @agreements = Agreement.all
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to @agreement, notice: 'Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def active
    agreement = Agreement.find(params[:id])
    if agreement
      agreement.update_attribute(:active, params[:active])
      render json: {:active => agreement}
      return
    else
      render plain: "Error", status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement).permit(:agreement_no, :name, :logo, :active)
    end
end
