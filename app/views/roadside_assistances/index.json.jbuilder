json.array!(@roadside_assistances) do |roadside_assistance|
  json.extract! roadside_assistance, :id, :name, :phone_number, :plate_number, :assistance_type, :lat, :long, :is_guest, :user_id
  json.url roadside_assistance_url(roadside_assistance, format: :json)
end
