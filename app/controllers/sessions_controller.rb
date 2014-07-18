class SessionsController < Devise::SessionsController
	skip_before_filter :verify_authenticity_token, :only => [:login, :logout]
	before_filter :authenticate_user!, :except => [:create, :destroy]
  respond_to :json

  def login

    if params[:auth_token]
      user_token = params[:auth_token].presence
      @resource = user_token && User.find_by_id(params[:user_id])
      return invalid_token_attempt unless @resource
      if @resource && Devise.secure_compare(@resource.authentication_token, user_token)
        valid = true
      else
        invalid_token_attempt
      end
    else
      @resource = User.find_for_database_authentication({:document_type => params[:document_type], :document_id => params[:document_id]})
      return invalid_login_attempt unless @resource
      if @resource.valid_password?(params[:password])
        if (@resource.confirmed?)
          valid = true
        else
          unconfirmed_login_attempt
        end
      else
        invalid_login_attempt    
      end
    end 
    
    if valid
      sign_in @resource, store: true
      @success = true
      @message = "Has iniciado sesión."
      render "login.json"
    end
  end

  def logout
    if (params[:auth_token])
      resource = User.find_for_database_authentication({:authentication_token => params[:auth_token]})
    end
    resource = User.find(params[:user_id]) unless resource
    resource.authentication_token = nil
    resource.save
    sign_out resource
    render :json => {:success => true}
  end

  protected

  def invalid_login_attempt
    @success = false
    @message = "Los datos introducidos son incorrectos."
    render "login.json"
  end

  def invalid_token_attempt
    @success = false
    @message = "Tu sesión ha expirado. Debes iniciar sesión nuevamente."
    render "login.json"
  end

  def unconfirmed_login_attempt
    @success = false
    @message = "Necesitas activar tu cuenta primero desde el correo que recibiste al registrarte."
    render "login.json"
  end

end
