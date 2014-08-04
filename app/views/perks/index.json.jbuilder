json.array!(@perks) do |perk|
  json.extract! perk, :id, :name, :description
end
