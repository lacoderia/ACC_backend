class CreateJoinTableUserVehicle < ActiveRecord::Migration
  create_table :users_vehicles, id: false do |t|
    t.belongs_to :user
    t.belongs_to :vehicle
  end
end
