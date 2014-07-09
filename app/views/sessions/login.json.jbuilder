json.partial! 'devise/generic', success: @success, message: @message
if @success
	json.set! :user do 
		json.extract! @resource, :id, :first_name, :last_name, :document_type, :document_id, :agreement_id, :is_member, :picture, :phone_number, :email, :authentication_token
		json.vehicles @resource.vehicles, :id, :plate_number, :soat_date
	end
end