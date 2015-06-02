ActiveAdmin.register ProcessLead, :as => "Solicitudes_de Tramite" do

  menu parent: 'Solicitudes', priority: 1

  config.filters = false
  config.sort_order = 'created_at_desc'  
	
  actions :all, :except => [:new, :edit, :destroy, :show]	

  index :title => "Solicitudes de Tramite" do
    column "Nombre", :first_name
    column "Apellido 1", :last_name_f
    column "Apellido 2", :last_name_m
    column "Tipo de Trámite", :process_type
    column "Otros", :other_type
    column "Teléfono", :phone_number
    column "Correo", :email
    column "Fecha", :created_at 
  end

end
