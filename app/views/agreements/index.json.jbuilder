json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :agreement_no, :name, :logo, :active
  json.url agreement_url(agreement, format: :json)
end
