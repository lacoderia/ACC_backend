class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :location_type_id
      t.string :address
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
