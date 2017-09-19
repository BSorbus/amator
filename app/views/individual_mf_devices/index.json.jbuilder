json.array!(@individual_mf_devices) do |individual_mf_device|
  json.extract! individual_mf_device, :id, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :name_type_station, :emission, :input_frequency, :output_frequency, :station_location
  json.url individual_mf_device_url(individual_mf_device, format: :json)
end
