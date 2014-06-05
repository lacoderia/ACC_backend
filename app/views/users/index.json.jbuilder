json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :document_type, :document_id, :is_member, :agreement_id, :phone_number, :email
  json.url user_url(user, format: :json)
end
