ActiveAdmin.register Lead, :as => "Solicitudes_de Registro" do
  
  menu parent: 'Solicitudes', priority: 3

  actions :all, :except => [:new, :edit, :destroy]

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
		f.inputs "Prospecto Details" do
			f.input :first_name
			f.input :last_name_f
			f.input :last_name_m
			f.input :document_type
			f.input :document_id, :label => "Document ID"
			f.input :phone_number
			f.input :email
			f.input :plate_number
		end
		f.actions
	end

	show do |lead|
		attributes_table do
			row "Tipo de Documento" do
				lead.document_type
			end
			row "Id de Documento" do
				lead.document_id
			end
			row "Nombre" do
				lead.first_name
			end
			row "Primer Apellido" do
				lead.last_name_f
			end
			row "Segundo Apellido" do 
				lead.last_name_m
			end
			row "Teléfono" do
				lead.phone_number
			end
			row "Email" do
				lead.email
			end
			row "Placas" do 
				lead.plate_number
			end
			row "Fecha" do
				lead.created_at
			end
		end
	end

	index :title => "Solicitudes de Registro" do
		column "Tipo de Documento", :document_type
		column "Id de Documento", :document_id
		column "Nombre", :first_name
		column "Primer Apellido", :last_name_f
		column "Segundo Apellido", :last_name_m
		column "Teléfono", :phone_number
		column "Email", :email
		column "Placas", :plate_number
		column "Fecha", :created_at
		actions :defaults => true
	end

	config.filters = false
	
end
