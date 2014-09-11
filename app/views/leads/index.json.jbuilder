json.array!(@leads) do |lead|
  json.extract! lead, :id, :document_type, :document_id, :first_name, :last_name_f, :last_name_m, :phone_number, :email, :plate_number
  json.url lead_url(lead, format: :json)
end
