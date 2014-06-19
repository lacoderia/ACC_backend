json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :name, :logo
end