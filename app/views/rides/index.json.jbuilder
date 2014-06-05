json.array!(@rides) do |ride|
  json.extract! ride, :id, :agreement_id, :user_id, :when, :origin, :destination, :cost, :seats, :notes
  json.url ride_url(ride, format: :json)
end
