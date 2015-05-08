class AddActiveToPerks < ActiveRecord::Migration
  def change
  	add_column :perks, :active, :boolean, default: true
  end
end
