class RegistrationsController < Devise::RegistrationsController
	skip_before_filter :verify_authenticity_token, :only => [:create]
	before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :is_member, :agreement_id, :document_id, :document_type, :email, :password, :password_confirmation, :phone_number, :picture)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:document_id, :email, :password, :password_confirmation, :current_password)}
  end

  def create
  	build_resource(sign_up_params)
    vehicle = nil
    if params[:vehicle]
      vehicle = Vehicle.new(vehicle_params)
    end
    begin
      resource.vehicles << vehicle if vehicle != nil
      resource_saved = resource.save
    rescue => e
      @success = false
      @message = e.message.index('plate_number') ? 'Ya existe un vehículo registrado con esa placa' : 'Ya existe un usuario registrado con esos datos de identificación.'
      return
    end
    yield resource if block_given?
    @user = resource
    if resource_saved
      @success = true
      @message = 'Tu registro se completó exitosamente. Te hemos enviado un correo electrónico con las instrucciones para activar tu cuenta.'
    else
      @success = false
      if resource.errors[:password_confirmation].size > 0
        @message = "El valor de la confirmación no es igual al de la contraseña."
      elsif resource.errors[:email].size > 0
        @message = 'Ya existe un usuario registrado con el correo electrónico ' + resource.email
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private 
  def vehicle_params
    params.require(:vehicle).permit(:plate_number, :brand, :model, :soat_date, :document_type_owner, :document_id_owner)
  end

end
