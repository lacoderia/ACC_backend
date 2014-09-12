class CarpoolController < ApplicationController
	before_filter :authenticate_user!
  def index
  	puts params[:user_id]
  	@user = User.find(params[:user_id])
  	@my_rides = @user.my_rides.where("ride_when > ?", Time.now).order(ride_when: :asc)
  	@rides= @user.rides.where("ride_when > ?", Time.now).order(ride_when: :asc)
  end
end
