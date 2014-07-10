class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:add_vehicle, :remove_vehicle]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def detail    
    @user = User.find(params[:id])
    @user.vehicles
  end

  def add_vehicle
    @user = User.find(params[:id])
    vehicle = Vehicle.find_by_plate_number(params[:vehicle][:plate_number])
    
    if vehicle != nil
      begin
        if @user.vehicles.find(vehicle.id) != nil
          @success = false
          @message = 'Ya tienes asociado este vehículo a tu cuenta.'
          return
        end
      rescue => e
      end
      is_new = false
      #owner = User.where('document_type == ? AND document_id == ?', @vehicle.document_type_owner, @vehicle.document_id_owner)[0]
    else
      vehicle = Vehicle.new(vehicle_params)
      is_new = true
    end
    
    @user.vehicles << vehicle
    @user.save
    @success = true
    @message = is_new ? 'El vehículo se registró y asoció correctamente a tu cuenta.' : 'El vehículo se asoció a tu cuenta pero fue registrado anteriormente por otro usuario.'
  end

  def remove_vehicle
    @user = User.find(params[:id])
    vehicle = Vehicle.find_by_plate_number(params[:vehicle][:plate_number])
    begin
      @user.vehicles.delete(@user.vehicles.find(vehicle.id))
    rescue => e
      @success = false
      @message = "El vehículo no existe o ya fue desoasociado de tu cuenta."
      return
    end
    @success = true
    @message = 'El vehículo ya no está asociado a tu cuenta.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :document_type, :document_id, :is_member, :agreement_id, :phone_number, :email, :picture, :vehicles)
    end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:plate_number, :brand, :model, :soat_date, :document_type_owner, :document_id_owner)
    end
end
