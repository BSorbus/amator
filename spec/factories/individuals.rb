FactoryGirl.define do
  factory :individual do
  	number "123/I/2015"
  	date_of_issue "2015-06-22"
  	valid_to "2025-06-22"
  	call_sign "SP2RIU"
  	category "1"
  	transmitter_power 100
  	station_location "Bydgoszcz"
  end

end
