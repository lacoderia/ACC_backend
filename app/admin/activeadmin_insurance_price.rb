ActiveAdmin.register InsurancePrice, :as => "Precios_de Seguro" do

  config.filters = false
  config.sort_order = 'id_asc'  
  config.paginate = false
	
  actions :all, :except => [:new, :destroy, :show]	
        
  permit_params :price

  index :title => "Precios de Seguro" do
    column "Clase de Vehículo", :vehicle_type
    column "Cilindraje", :size
    column "Antigüedad", :age_old
    column "Costo", :price do |cur|
      number_to_currency(cur.price, precision:2)
    end
    actions :defaults => true
  end

  form do |f|
    f.inputs 'Detalles de Precios de Seguro' do
      f.input :vehicle_type, :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :size, :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :age_old, :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :price
    end
    f.actions
  end
  
end
