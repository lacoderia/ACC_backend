json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :name, :mail_domain
end