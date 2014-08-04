class AddPerkIdToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :perk_id, :integer
  end
end
