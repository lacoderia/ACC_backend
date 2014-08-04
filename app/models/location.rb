class Location < ActiveRecord::Base
	belongs_to :location_type
	belongs_to :perk
end
