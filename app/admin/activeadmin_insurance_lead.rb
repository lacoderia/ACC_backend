ActiveAdmin.register InsuranceLead, :as => "Solicitudes_de Seguro" do

  menu parent: 'ACC'

  config.filters = false
  config.sort_order = 'created_at_desc'  
	
  actions :all, :except => [:new, :edit, :destroy, :show]	

  index :title => "Solicitudes de Seguro" do
    column "Nombre", :first_name
    column "Apellido 1", :last_name_f
    column "Apellido 2", :last_name_m
    column "Tipo de Trámite", :insurance_type
    column "Otros", :other_type
    column "Teléfono", :phone_number
    column "Correo", :email
    column "Fecha", :created_at 
  end
  
end
