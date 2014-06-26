class ConfirmationsController < Devise::ConfirmationsController

	def show
		self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      @message = "¡Tu cuenta se activó exitosamente! Ya puedes iniciar sesión en la aplicación"
    else
      @message = "Ocurrió un error y tu cuenta no pudo activarse. Intenta nuevamente más tarde"
    end
	end

end
