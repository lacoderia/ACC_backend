json.extract! @user, :id, :first_name, :last_name
json.my_rides @my_rides, :id, :ride_when, :origin, :destination
json.rides @rides, :id, :ride_when, :origin, :destination