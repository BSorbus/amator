json.array!(@club_mf_devices) do |club_mf_device|
  json.extract! club_mf_device, :id, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :name_type_station, :emission, :input_frequency, :output_frequency, :enduser_name, :enduser_city, :enduser_street, :enduser_house, :enduser_number, :applicant_name, :applicant_city, :applicant_street, :applicant_house, :applicant_number, :station_city, :station_street, :station_house, :station_number
  json.url club_mf_device_url(club_mf_device, format: :json)
end
