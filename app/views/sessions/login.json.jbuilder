json.partial! 'devise/generic', success: @success, message: @message
if @success
	json.set! :user do
		json.extract! @resource, :id, :first_name, :last_name, :document_type, :document_id, :agreement_id, :is_member, :phone_number, :email, :authentication_token
		json.avatar @resource.avatar.url(:medium)
		json.agreement_logo @resource.agreement.logo.url
		json.vehicles @resource.vehicles, :id, :plate_number, :soat_date
	end
end