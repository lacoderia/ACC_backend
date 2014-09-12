ActiveAdmin.register Lead do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :document_type, :document_id, :first_name, :last_name_f, :last_name_m, :phone_number, :email, :plate_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

	form do |f|
		f.inputs "Lead Details" do
			f.input :document_type
			f.input :document_id, :label => "Document ID"
			f.input :first_name
			f.input :last_name_f
			f.input :last_name_m
			f.input :phone_number
			f.input :email
			f.input :plate_number
		end
		f.actions
	end

	index do
		column :document_type
		column "Document ID", :document_id
		column :first_name
		column :last_name_f
		column :last_name_m
		column :phone_number
		column :email
		column :plate_number
		actions :defaults => true
	end

	config.filters = false

end
