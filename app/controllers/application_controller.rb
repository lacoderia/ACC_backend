class ApplicationController < ActionController::Base
  before_action :set_timezone
  #before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_timezone
    Time.zone = 'Bogota'
  end
  
end
