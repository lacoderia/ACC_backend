json.success @success
json.message @message
json.set! :ride do
	json.partial! 'detail', ride: @ride
end