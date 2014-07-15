json.extract! ride, :id, :agreement_id, :user_id, :ride_when, :origin, :destination, :cost, :seats, :notes
json.owner ride.owner, :id, :first_name, :last_name, :email, :avatar.url(:thumb)
json.users ride.users, :id, :first_name, :last_name, :email, :avatar.url(:thumb)