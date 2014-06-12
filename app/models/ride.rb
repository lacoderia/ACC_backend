class Ride < ActiveRecord::Base
	belongs_to :user, :foreign_key => :id, :class_name => 'User' 
	has_and_belongs_to_many :users
end
