json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :name, :logo, :mail_domain
end