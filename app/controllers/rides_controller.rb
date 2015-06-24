class RidesController < ApplicationController
  authorize_resource
  #before_filter :authenticate_user!
  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create, :book]
  
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

    if @ride.ride_when > Time.now 
      if @ride.save
        @success = true
        @message = "El viaje se ha publicado correctamente."
        #format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        #format.json { render :show, status: :created, location: @ride }
      else
        @success = false
        @message = "Ocurrió un error y el viaje no fue publicado. Intenta nuevamente."
        #format.html { render :new }
        #format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    else
      @success = false
      @message = "La fecha y hora del viaje debe ser posteriores a la fecha y hora actuales."
      #format.html { render :new }
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
    @ride.owner
    @ride.users
  end

  def available
    user = User.find(params[:user_id])
    @rides = Ride.where('user_id != ? AND ride_when > ? AND agreement_id = ? AND seats > (select count(*) from rides_users where ride_id = id) AND id NOT IN (select ride_id from rides_users where user_id = ?)', user.id, Time.now, user.agreement_id, user.id).order(ride_when: :asc)
    @hash = Digest::MD5.hexdigest(@rides.to_json)
  end

  def book
    @ride = Ride.find(params[:id])
    user = User.find(params[:user_id])
    if (@ride.seats > @ride.users.size)
      if (@ride.users.where('id = ?', user.id).size == 0)
        @ride.users << user
        @ride.save
        @success = true
        @message = 'Tu lugar ha sido reservado.'
        RideMailer.book_email(@ride.owner, user, @ride).deliver
      else
        @success = false
        @message = 'Ya tienes un lugar reservado.'
      end
    else
      @success = false
      @message = 'Ya no hay cupo en este viaje.'
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
