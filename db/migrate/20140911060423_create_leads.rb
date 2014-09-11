class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :document_type
      t.string :document_id
      t.string :first_name
      t.string :last_name_f
      t.string :last_name_m
      t.string :phone_number
      t.string :email
      t.string :plate_number

      t.timestamps
    end
  end
end
