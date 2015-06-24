class ApplicationController < ActionController::Base
  before_action :set_timezone
  #before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied(exception)
    redirect_to "/422.html", :alert => exception.message
  end
  
  #def get_current_admin_user
  #  current_admin_user
  #end
  
  #alias_method :current_user, :get_current_admin_user

  def set_timezone
    Time.zone = 'Bogota'
  end
  
end
