ActiveAdmin.register Perk, :as => "Descuentos" do
  
  config.filters = false
  config.sort_order = 'id_asc'  
  
  actions :all, :except => [:destroy]	
	
  permit_params :name, :description, :active, :logo

  index :title => "Descuentos" do
    column "Nombre", :name
    column "Descripción", :description

    column :logo, :class => "photo_alignment" do |perk|
      link_to( (image_tag perk.logo.url(:thumb)), perk.logo.url(:original), :target=>"_blank" )
    end

    column "Activo", :active do |perk|
      if perk.active
        check_box_tag "perk_link_#{perk.id}", "active", true, :onclick => "activePerkCheck(#{perk.id}, false)"
      else
	check_box_tag "perk_link_#{perk.id}", "active", false, :onclick => "activePerkCheck(#{perk.id}, true)" 
      end
    end
    actions :defaults => true
  end

  form do |f|
    f.inputs "Detalles de Descuento" do
      f.input :name, :label => "Nombre"
      f.input :description, :label => "Descripción"
      f.input :active, :label => "Activo"
      f.input :logo, :required => false, :as => :file
    end
    f.actions
  end

  show do |perk|
    attributes_table do
      row "Nombre " do
              perk.name
      end
      row "Descripción" do
              perk.description
      end
      row "Activo" do
              perk.active
      end
      row "Logo", :class => "photo_medium" do
              link_to( (image_tag perk.logo.url(:medium)), perk.logo.url(:original), :target=>"_blank" )
      end
    end
  end

end
