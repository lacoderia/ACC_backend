json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :agreement_no, :name, :active
  json.url agreement_url(agreement, format: :json)
end
