class Ride < ActiveRecord::Base
	belongs_to :owner, :foreign_key => :user_id, :class_name => 'User'
	belongs_to :agreement
	has_and_belongs_to_many :users
end
