class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  #skip_before_filter :verify_authenticity_token, :only => [:create]

  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = Ride.new(ride_params)

    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def detail    
    @ride = Ride.find(params[:id])
    @ride.user
    @ride.users
    respond_to do |format|
      format.json {render :json => @ride, :include => {:user => {:only => [:id, :first_name, :last_name]}, :users => {:only => [:id, :first_name, :last_name]}}}
    end
  end

  def available
    rides = Ride.where('user_id != ? AND ride_when > ? AND seats > (select count(*) from rides_users where ride_id = id)', params[:user_id], Time.now).order(ride_when: :asc)
    result = {:rides => rides.select(:id, :origin, :destination, :ride_when)}
    respond_to do |format|
      format.json {render :json => result}      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:agreement_id, :user_id, :ride_when, :origin, :destination, :cost, :seats, :notes)
    end
end
