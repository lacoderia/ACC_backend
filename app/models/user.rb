class User < ActiveRecord::Base
	has_many :my_rides, :foreign_key => :user_id, :class_name => 'Ride' 
	has_and_belongs_to_many :rides
end
