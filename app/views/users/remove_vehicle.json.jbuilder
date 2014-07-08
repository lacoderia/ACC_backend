json.success @success
json.message @message
if @success
	json.vehicles @user.vehicles, :id, :plate_number, :soat_date
end