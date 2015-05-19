json.array!(@perks) do |perk|
  json.extract! perk, :id, :name, :description
  json.logo perk.logo.url(:medium)
end
