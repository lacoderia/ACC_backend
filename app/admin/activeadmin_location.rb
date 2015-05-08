ActiveAdmin.register Location, :as => "Gasolineras" do

  config.filters = false
  config.sort_order = 'id_asc'  
  
  actions :all, :except => [:destroy]	
  
  permit_params :name, :address, :phone, :logo, :lat, :long, :active, :location_type_id

  index :title => "Gasolineras" do
    column "Nombre", :name
    column "Dirección", :address
    column "Teléfono", :phone

    column :logo, :class => "photo_alignment" do |location|
      link_to( (image_tag location.logo.url(:thumb)), location.logo.url(:original), :target=>"_blank" )
    end

    column "Ubicación" do |location|
      link_to "#{location.lat}, #{location.long}", "http://maps.google.com/?q=#{location.lat},#{location.long}", :target => "_blank"	
    end

    column "Activo", :active do |location|
      if location.active
        check_box_tag "location_link_#{location.id}", "active", true, :onclick => "activeLocationCheck(#{location.id}, false)"
      else
	check_box_tag "location_link_#{location.id}", "active", false, :onclick => "activeLocationCheck(#{location.id}, true)" 
      end
    end
    actions :defaults => true
  end

  form do |f|
    f.inputs "Detalles de Gasolineras" do
      f.input :name, :label => "Nombre"
      f.input :address, :label => "Dirección"
      f.input :phone, :label => "Teléfono"
      f.input :active, :label => "Activo"
      f.input :location_type_id, :as => :hidden, :value => 2
      f.input :logo, :required => false, :as => :file
    end
    f.actions
  end
  
  show do |location|
    attributes_table do
      row "Nombre " do
              location.name
      end
      row "Dirección" do
              location.address
      end
      row "Teléfono" do
              location.phone
      end
      row "Activo" do
              location.active
      end
      row "Ubicación" do
        link_to "#{location.lat}, #{location.long}", "http://maps.google.com/?q=#{location.lat},#{location.long}", :target => "_blank"	
      end
      row "Logo", :class => "photo_medium" do
              link_to( (image_tag location.logo.url(:medium)), location.logo.url(:original), :target=>"_blank" )
      end
    end
  end


end
