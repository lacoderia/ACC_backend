json.success @success
json.message @message
if @success
	json.set! :roadside_assistance do 
		json.extract! @roadside_assistance, :id, :name, :phone_number, :plate_number, :is_guest, :assistance_type, :lat, :long
	end
end