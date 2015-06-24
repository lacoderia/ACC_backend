class RegistrationsController < Devise::RegistrationsController
  authorize_resource
  #before_filter :authenticate_user!
  #skip_before_filter :verify_authenticity_token, :only => [:create]
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :is_member, :agreement_id, :document_id, :document_type, :email, :password, :password_confirmation, :phone_number, :picture)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:document_id, :email, :password, :password_confirmation, :current_password)}
  end

  def create
  	build_resource(sign_up_params)
    vehicle = nil
    if params[:vehicle]
      vehicle = Vehicle.find_by_plate_number(params[:vehicle][:plate_number])
      if (vehicle != nil)
        is_new = false
      else
        vehicle = Vehicle.new(vehicle_params)
        is_new = true
      end
    end
    begin
      resource.vehicles << vehicle if vehicle != nil
      resource_saved = resource.save
    rescue => e
      @success = false
      #@message = 'Ya existe un usuario registrado con esos datos de identificación.'
      @message = e.message.index('document_type') ? 'Ya existe un usuario registrado con esos datos de identificación.' : 'Ocurrió un error durante el registro. Favor intentar nuevamente.'
      return
    end
    yield resource if block_given?
    @user = resource
    if resource_saved
      @success = true
      @message = 'Tu registro ha sido exitoso, te hemos enviado un correo para activar tu cuenta. El email puede estar en la bandeja de spam.'
      @message += ' El vehículo se asoció a tu cuenta pero fue registrado anteriormente por otro usuario.' unless is_new == nil || is_new
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
