ActiveAdmin.register Agreement, :as => "Convenios" do
   
	actions :all, :except => [:destroy]

	permit_params :agreement_no, :name, :mail_domain, :active, :logo

	index :title => "Convenio" do
		#column '<div style="display: inline-block; vertical-align: top;">No. de Convenio</div><div style="display: inline-block; vertical-align: top;" class="tooltip_wrapper"><img src="/assets/info.png" /><div class="helper_tooltip"><div class="tooltip_triangle" style="margin-left: 43.5px;"></div>Tooltip text here</div></div>'.html_safe, :agreement_no	
		column "No. Convenio", :agreement_no	
		column "Nombre", :name
		column "Dominio Email", :mail_domain
		column "Activo", :active do |agreement|
                  if agreement.active
                    check_box_tag "agreement_link_#{agreement.id}", "active", true, :onclick => "activeAgreementCheck(#{agreement.id}, false)"
                  else
                    check_box_tag "agreement_link_#{agreement.id}", "active", false, :onclick => "activeAgreementCheck(#{agreement.id}, true)"
                  end
                end

		column "Logo", :logo, :class => "photo_thumb" do |agreement|
			link_to( (image_tag agreement.logo.url(:thumb)), agreement.logo.url(:original), :target=>"_blank" )
		end
		actions :defaults => true
	end

	form do |f|
		f.inputs "Detalles de Convenio" do
			f.input :agreement_no, :label => "No. Convenio"
			f.input :name, :label => "Nombre"
			f.input :mail_domain, :label => "Dominio Email"
			f.input :active, :label => "Activo"
			f.input :logo, :required => false, :as => :file
			# Will preview the image when the object is edited
		end
		f.actions
	end

	show do |agreement|
		attributes_table do
			row "No. Convenio" do
				agreement.agreement_no
			end
			row "Nombre" do
				agreement.name
			end
			row "Dominio Email" do
				agreement.mail_domain
			end
			row "Activo" do
				agreement.active
			end
			row "Logo", :class => "photo_medium" do
				link_to( (image_tag agreement.logo.url(:thumb)), agreement.logo.url(:original), :target=>"_blank" )
			end
		end
	end
	
	config.filters = false
end
