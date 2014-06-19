class SessionsController < Devise::SessionsController
	skip_before_filter :verify_authenticity_token, :only => [:create]
	before_filter :authenticate_user!, :except => [:create, :destroy]
  respond_to :json

	def create
    resource = User.find_for_database_authentication({:document_type => params[:document_type], :document_id => params[:document_id]})
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:password])
      sign_in(:user, resource)
      render :json=> {:success=>true, :auth_token=>resource.authentication_token}
      return
    end	
    invalid_login_attempt
  end

  def destroy
    resource = User.find_for_database_authentication({:document_type => params[:document_type], :document_id => params[:document_id]})
    resource.authentication_token = nil
    resource.save
    render :json=> {:success=>true}
  end

  protected

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

end
