ActiveAdmin.register Ride do


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

	form do |f|
		f.inputs "Ride Details" do
			f.input :agreement, :collection => Agreement.all, :as => :select
			f.input :user, :collection => User.all, :as => :select
			f.input :ride_when
			f.input :origin
			f.input :destination
			f.input :cost
			f.input :seats
			f.input :notes
		end
		f.actions
	end

	config.filters = false

end
