class ChangeDescriptionTypeInLocations < ActiveRecord::Migration
  def change
  	change_column :locations, :description, :text
  end
end
