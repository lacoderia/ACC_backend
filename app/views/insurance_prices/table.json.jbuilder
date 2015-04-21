json.set! :vehicles_type do
	vehicle_types = @insurance_prices.group_by(&:vehicle_type)
	json.array!(vehicle_types.keys) do |vehicle_type|
    json.name vehicle_type
    json.set! :capacities do
    	sizes = vehicle_types[vehicle_type].group_by(&:size)
  		json.array!(sizes.keys) do |size|
   			json.name size
   			json.set! :models do
   				ages = sizes[size].group_by(&:age_old)
   				json.array!(ages.keys) do |age_old|
   					json.name age_old.nil? ? "" : age_old
   					json.cost ActionController::Base.helpers.number_to_currency(ages[age_old][0].price, precision:0)
   				end
   			end
    	end
    end
	end
end 