class CreateRoadsideAssistances < ActiveRecord::Migration
  def change
    create_table :roadside_assistances do |t|
      t.string :name
      t.string :phone_number
      t.string :plate_number
      t.string :assistance_type
      t.float :lat
      t.float :long
      t.boolean :is_guest
      t.integer :user_id

      t.timestamps
    end
  end
end
