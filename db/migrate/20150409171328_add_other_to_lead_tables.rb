class AddOtherToLeadTables < ActiveRecord::Migration
  def change
  	add_column :process_leads, :other_type, :string
  	add_column :insurance_leads, :other_type, :string
  end
end
