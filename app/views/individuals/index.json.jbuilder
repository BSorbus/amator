json.array!(@individuals) do |individual|
  json.extract! individual, :id, :department, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :station_location
  json.url individual_url(individual, format: :json)
end
