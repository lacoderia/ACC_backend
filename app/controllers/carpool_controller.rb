class CarpoolController < ApplicationController
  def index
  	puts params[:user_id]
  	@user = User.find(params[:user_id])
  	@user.my_rides.includes(:user, :users) + @user.rides.includes(:user, :users)
  	respond_to do |format|
      format.json { render :json => @user, :only => [:id, :first_name, :last_name], :include => [:my_rides, :rides]} #[:my_rides => {:include => [:users, :user]}]}#
    end
  end
end
