ActiveAdmin.register User, :as => "Usuario" do

	actions :all, :except => [:new, :edit, :destroy]	

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

	index :title => "Usuarios" do
		column "Nombre", :first_name
		column "Apellido", :last_name
		column "Tipo de documento", :document_type
		column "Id de documento", :document_id
		column "Email", :email
		column "Teléfono", :phone_number
		column "Es afiliado", :is_member
		column "Vehículos", :vehicles do |user|
	   user.vehicles.map { |vehicle| vehicle.plate_number }.join("<br/>").html_safe
  	end
		actions :defaults => true
	end

	show do |user|
		attributes_table do
			row "Nombre" do
				user.first_name
			end
			row "Apellido" do
				user.last_name
			end
			row "Tipo de documento" do
				user.document_type	
			end
			row "Id de documento" do
				user.document_id
			end
			row "Email" do
				user.email
			end
			row "Teléfono" do
				user.phone_number
			end
			row "Es afiliado" do
				user.is_member
			end
			row "Vehículos" do
	   		user.vehicles.map { |vehicle| vehicle.plate_number }.join("<br/>").html_safe
			end
		end
	end

	config.filters = false

end
