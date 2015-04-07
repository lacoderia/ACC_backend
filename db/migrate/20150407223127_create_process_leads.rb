class CreateProcessLeads < ActiveRecord::Migration
  def change
    create_table :process_leads do |t|
      t.string :first_name
      t.string :last_name_f
      t.string :last_name_m
      t.string :phone_number
      t.string :email
      t.string :process_type

      t.timestamps
    end
  end
end
