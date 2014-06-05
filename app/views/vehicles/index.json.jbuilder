json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :user_id, :plate_number, :brand, :model, :soat_date, :poliza_date
  json.url vehicle_url(vehicle, format: :json)
end
