class CarpoolController < ApplicationController
  def index
  	puts params[:user_id]
  	user = User.find(params[:user_id])
  	userJson = {}
  	userJson[:id] = user.id
  	userJson[:first_name] = user.first_name
  	userJson[:last_name] = user.last_name
  	userJson[:my_rides] = user.my_rides.select(:id, :ride_when, :origin, :destination).order(ride_when: :asc).includes(:user, :users)
  	userJson[:rides] = user.rides.select(:id, :ride_when, :origin, :destination).order(ride_when: :asc).includes(:user, :users)
  	#@user[:ordered_rides] = @u.rides.includes(:user, :users).order(ride_when: :desc)
  	respond_to do |format|
      format.json { render :json => userJson}#, :include => {:my_rides => {:only => [:id, :origin, :destination]}, :rides => {:only => [:id, :origin, :destination]}}} #[:my_rides => {:include => [:users, :user]}]}#
    end
  end
end
