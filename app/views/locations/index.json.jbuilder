json.array!(@locations) do |location|
  json.extract! location, :id, :name, :lat, :long, :location_type_id, :address, :phone, :description
  json.logo location.logo.url(:medium)
end
