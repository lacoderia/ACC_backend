class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :plate_number
      t.string :brand
      t.string :model
      t.datetime :soat_date
      t.string :document_type_owner
      t.string :document_id_owner
      t.timestamps
    end
    add_index :vehicles, :plate_number, unique: true
  end
end
