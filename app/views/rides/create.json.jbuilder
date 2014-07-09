json.success @success
json.message @message
if @success
	json.set! :ride do 
		json.extract! @ride, :id, :agreement_id, :user_id, :ride_when, :origin, :destination, :cost, :seats, :notes
	end
end