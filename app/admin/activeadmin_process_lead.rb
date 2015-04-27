ActiveAdmin.register ProcessLead, :as => "Solicitudes_de Tramite" do

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
  
  filter :first_name
  filter :last_name_f
  filter :last_name_m
  filter :process_type
  filter :other_type
  filter :phone_number
  filter :email
  filter :created_at
  
end
