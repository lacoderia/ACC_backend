json.array!(@process_leads) do |process_lead|
  json.extract! process_lead, :id, :first_name, :last_name_f, :last_name_m, :phone_number, :email, :process_type
  json.url process_lead_url(process_lead, format: :json)
end
