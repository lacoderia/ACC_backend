json.extract! ride, :id, :agreement_id, :user_id, :ride_when, :origin, :destination, :cost, :seats, :notes
json.set! :owner do 
	json.extract! ride.owner, :id, :first_name, :last_name, :email
	json.avatar ride.owner.avatar.url(:thumb)
end
json.users ride.users do |user|
	json.extract! user, :id, :first_name, :last_name, :email
	json.avatar user.avatar.url(:thumb)
end