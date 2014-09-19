ActiveAdmin.register RoadsideAssistance, :as => "Gruas/Desvares" do

	actions :all, :except => [:new, :edit, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :phone_number, :plate_number, :assistance_type, :lat, :long, :is_guest, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

	index :title => "Grúas/Desvares" do
		column "Nombre", :name
		column "Teléfono", :phone_number
		column "Placas", :plate_number
		column "Tipo de Servicio", :assistance_type
		column "Ubicación" do |roadside_assistance|
			link_to "#{roadside_assistance.lat}, #{roadside_assistance.long}", "http://maps.google.com/?q=#{roadside_assistance.lat},#{roadside_assistance.long}", :target => "_blank"	
		end
		column "Es invitado", :is_guest
		column "Usuario" do |roadside_assistance|
			link_to("#{roadside_assistance.user.first_name} #{roadside_assistance.user.last_name}", admin_usuario_url(roadside_assistance.user)) if roadside_assistance.user
		end
		actions :defaults => true
	end

	show do |ra|
		attributes_table do
			row "Nombre" do
				ra.name
			end
			row "Teléfono" do
				ra.phone_number
			end
			row "Placas" do
				ra.plate_number
			end
			row "Tipo de Servicio" do
				ra.assistance_type
			end
			row "Ubicación" do
				link_to "#{ra.lat}, #{ra.long}", "http://maps.google.com/?q=#{ra.lat},#{ra.long}", :target => "_blank"	
			end
			row "Es invitado" do
				ra.is_guest
			end
			row "Usuario" do
				link_to("#{ra.user.first_name} #{ra.user.last_name}", admin_usuario_url(ra.user)) if ra.user
			end
		end
	end

	config.filters = false

end
