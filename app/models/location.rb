class Location < ActiveRecord::Base
	belongs_to :location_type

	def logo
		return location_type.logo
	end
	
end
