class CreateInsuranceLeads < ActiveRecord::Migration
  def change
    create_table :insurance_leads do |t|
      t.string :first_name
      t.string :last_name_f
      t.string :last_name_m
      t.string :phone_number
      t.string :email
      t.string :insurance_type

      t.timestamps
    end
  end
end
