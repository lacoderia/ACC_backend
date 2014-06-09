class CreateJoinTableRideUser < ActiveRecord::Migration
  create_table :rides_users, id: false do |t|
     t.belongs_to :ride
     t.belongs_to :user
    end
end
