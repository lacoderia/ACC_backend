json.success @success
json.message @message
if @success
	json.vehicle @vehicle, :id, :plate_number, :soat_date
end