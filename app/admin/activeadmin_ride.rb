ActiveAdmin.register Ride, :as => "Viajes Compartidos" do
	
  menu parent: 'Carro Compartido'
  actions :all, :except => [:new, :edit, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :agreement_id, :user_id, :ride_when, :origin, :destination, :cost, :seats, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

	index :title=> "Viajes Compartidos" do
		column "Usuario", :owner do |ride|
			"#{ride.owner.first_name} #{ride.owner.last_name}"
		end
		column "Convenio", :agreement do |ride|
			ride.agreement.name
		end
		column "Fecha", :ride_when
		column "Origen", :origin
		column "Destino", :destination
		column "Costo", :cost
		column "Cupo", :seats
		column "Notas", :notes
		column "Pasajeros", :users do |ride|
	  	ride.users.map { |user| link_to("#{user.first_name} #{user.last_name}", admin_usuario_url(user)) }.join("<br/>").html_safe
		end
		actions :defaults => true
	end

	form do |f|
		f.inputs "Viaje Compartido Details" do
			f.input :user_id, :collection => User.all, :as => :select, :member_label => Proc.new { |u| "#{u.first_name} #{u.last_name}" } 
			f.input :agreement_id, :collection => Agreement.all, :as => :select
			f.input :ride_when
			f.input :origin
			f.input :destination
			f.input :cost
			f.input :seats
			f.input :notes
		end
		f.actions
	end

	show do |ride|
		attributes_table do
			row "Usuario" do
				"#{ride.owner.first_name} #{ride.owner.last_name}"
			end
			row "Convenio" do
				ride.agreement.name
			end
			row "Fecha" do
				ride.ride_when	
			end
			row "Origen" do
				ride.origin
			end
			row "Destino" do
				ride.destination
			end
			row "Costo" do
				ride.cost
			end
			row "Cupo" do
				ride.seats
			end
			row "Notas" do
				ride.notes
			end
			row "Pasajeros" do
	  		ride.users.map { |user| link_to("#{user.first_name} #{user.last_name}", admin_usuario_url(user)) }.join("<br/>").html_safe
			end
		end
	end

	config.filters = false
	
end
