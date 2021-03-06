json.array!(@clubs) do |club|
  json.extract! club, :id, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :enduser_name, :enduser_city, :enduser_street, :enduser_house, :enduser_number, :applicant_name, :applicant_city, :applicant_street, :applicant_house, :applicant_number, :station_city, :station_street, :station_house, :station_number, :lat, :lng
  json.url club_url(club, format: :json)
end
