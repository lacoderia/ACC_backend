json.array!(@insurance_prices) do |insurance_price|
  json.extract! insurance_price, :id, :vehicle_type, :size, :age_old, :price
end