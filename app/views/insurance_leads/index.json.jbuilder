json.array!(@insurance_leads) do |insurance_lead|
  json.extract! insurance_lead, :id, :first_name, :last_name_f, :last_name_m, :phone_number, :email, :insurance_type
  json.url insurance_lead_url(insurance_lead, format: :json)
end
