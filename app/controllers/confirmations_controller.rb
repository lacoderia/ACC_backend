class ConfirmationsController < Devise::ConfirmationsController
    authorize_resource :class => false
    #before_filter :authenticate_user!
    skip_before_filter :verify_authenticity_token, :only => [:create]

    def show
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?

      if resource.errors.empty?
        @success = true
        @message = "¡Tu cuenta se activó exitosamente! Ya puedes iniciar sesión en la aplicación."
      else
        @success = false
        @message = "Ocurrió un error y tu cuenta no pudo activarse. Intenta nuevamente más tarde."
      end
    end

    def create
      self.resource = resource_class.send_confirmation_instructions(resource_params)
      yield resource if block_given?

      if successfully_sent?(resource)
        @success = true
        @message = 'Te hemos enviado un correo electrónico con las instrucciones para activar tu cuenta.'
      else
        @success = false
        @message = 'La dirección de correo electrónico es incorrecta. Escribe la misma que usaste durante el registro.'
      end
    end

end
