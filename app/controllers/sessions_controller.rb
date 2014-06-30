class SessionsController < Devise::SessionsController
	skip_before_filter :verify_authenticity_token, :only => [:login, :logout]
	before_filter :authenticate_user!, :except => [:create, :destroy]
  respond_to :json

  def login
    @resource = User.find_for_database_authentication({:document_type => params[:document_type], :document_id => params[:document_id]})
    return invalid_login_attempt unless @resource
    if @resource.valid_password?(params[:password])
      if (@resource.confirmed?)
        sign_in(:user, @resource)
        @success = true
        @message = "Has iniciado sesión."
        render "login.json"
        return
      else
        unconfirmed_login_attempt
        return
      end
    end	
    invalid_login_attempt
  end

  def logout
    resource = User.find_for_database_authentication({:authentication_token => params[:auth_token]})
    resource.authentication_token = nil
    resource.save
    render :json => {:success => true}
  end

  protected

  def invalid_login_attempt
    @success = false
    @message = "Los datos introducidos son incorrectos."
    render "login.json"
  end

  def unconfirmed_login_attempt
    @success = false
    @message = "Necesitas activar tu cuenta primero desde el correo que recibiste al registrarte."
    render "login.json"
  end

end
