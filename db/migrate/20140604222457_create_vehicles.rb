class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :user_id
      t.string :plate_number
      t.string :brand
      t.string :model
      t.datetime :soat_date
      t.datetime :poliza_date

      t.timestamps
    end
  end
end
