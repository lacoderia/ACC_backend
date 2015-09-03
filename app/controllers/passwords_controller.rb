class PasswordsController < Devise::PasswordsController
  authorize_resource :class => false
  #before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => [:create, :update]
	
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      @success = true
      @message = "Te hemos enviado un correo, haz clic en el enlace para reestablecer tu contraseña. El email puede estar en la bandeja de spam."
    else
      @success = false
      @message = 'La dirección de correo es incorrecta. Escribe la misma que usaste durante el registro.'
    end
	end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_flashing_format?
      @message = "Tu contraseña ha sido cambiada exitosamente"
      render "password_change"
    else
      respond_with resource
    end
  end

end
