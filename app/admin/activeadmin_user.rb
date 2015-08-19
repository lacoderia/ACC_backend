ActiveAdmin.register User, :as => "Usuario" do
  
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      if params[:user][:email].blank?
        params[:user].delete("email")
        params[:user].delete("email_confirmation")
      end
      super
    end
  end

  before_save do |user|
    user.skip_confirmation!
    user.skip_reconfirmation!
  end

	actions :all, :except => [:new, :destroy, :show]	

  
        permit_params :first_name, :last_name, :email, :document_id, :active
  
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
                column "Activo", :active do |user|
                  if user.active
		    check_box_tag "user_link_#{user.id}", "active", true, :onclick => "activeUserCheck(#{user.id}, false)"
		  else
		    check_box_tag "user_link_#{user.id}", "active", false, :onclick => "activeUserCheck(#{user.id}, true)" 
		  end
                end
                column "Confirmado", :confirmed_at do |user|
                  if user.confirmed_at
                    check_box_tag "user_confirmed_#{user.id}", "confirmed", true, disabled: true
                  else
                    check_box_tag "user_confirmed_#{user.id}", "confirmed", false, disabled: true
                  end
                end

		column "Vehículos", :vehicles do |user|
                  user.vehicles.map { |vehicle| vehicle.plate_number }.join("<br/>").html_safe
                end
		actions :defaults => true
	end

        form do |f|

          	f.inputs "Detalles de Usuario" do
                        f.input :first_name, :label => "Nombre"
                        f.input :last_name, :label => "Apellido"
                        f.input :email
                        f.input :document_id
                        f.input :confirmed_at, :as => :string, disabled: true
                        f.input :active
			# Will preview the image when the object is edited
		end
		f.actions

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
