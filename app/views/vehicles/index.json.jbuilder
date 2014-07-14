json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :plate_number, :soat_date
  json.url vehicle_url(vehicle, format: :json)
end
