json.extract! @user, :id, :agreement_id, :first_name, :last_name, :is_member, :email, :avatar.url(:medium)
json.vehicles @user.vehicles, :id, :plate_number, :soat_date