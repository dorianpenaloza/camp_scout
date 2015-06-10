json.array!(@camps) do |camp|
  json.extract! camp, :id, :name, :weeks, :cost, :telephone, :website, :address, :latiude, :longitude
  json.url camp_url(camp, format: :json)
end
