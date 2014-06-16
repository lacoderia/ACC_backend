class CarpoolController < ApplicationController
  def index
  	puts params[:user_id]
  	user = User.find(params[:user_id])
  	userJson = {}
  	userJson[:id] = user.id
  	userJson[:first_name] = user.first_name
  	userJson[:last_name] = user.last_name
  	userJson[:my_rides] = user.my_rides.select(:id, :ride_when, :origin, :destination).where("ride_when > ?", Time.now).order(ride_when: :asc)
  	userJson[:rides] = user.rides.select(:id, :ride_when, :origin, :destination).where("ride_when > ?", Time.now).order(ride_when: :asc)
  	respond_to do |format|
      format.json { render :json => userJson}
    end
  end
end
