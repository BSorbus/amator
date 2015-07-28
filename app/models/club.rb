class Club < ActiveRecord::Base

  geocoded_by :full_station_address, :latitude => :lat, :longitude => :lng  # can also be an IP address
  after_validation :geocode           # auto-fetch coordinates


  def fullname
    "#{number}, #{call_sign}"
  end

  def fullname_with_station_address
    "#{number}, #{call_sign} (#{station_city}, #{station_street})"
  end

  def full_station_address
    "pl, #{station_city}, #{station_street}"
  end

  def self.to_csv
    CSV.generate(headers: false, col_sep: ';', converters: nil, skip_blanks: false, force_quotes: false) do |csv|
      columns_header = %w{department number valid_to call_sign category transmitter_power operator_1 operator_2 operator_3 applicant_name applicant_city applicant_street applicant_house applicant_number enduser_name enduser_city enduser_street enduser_house enduser_number	station_city station_street station_house station_number }
      csv << columns_header
      all.each do |rec|
        csv << [
                rec.department.strip,
                rec.number.strip,
                rec.valid_to,
                rec.call_sign,
                rec.category,
                rec.transmitter_power,
                rec.operator_1,
                rec.operator_2,
                rec.operator_3,
                rec.applicant_name,
                rec.applicant_city,
                rec.applicant_street,
                rec.applicant_house,
                rec.applicant_number,
                rec.enduser_name,
                rec.enduser_city,
                rec.enduser_street,
                rec.enduser_house,
                rec.enduser_number,
                rec.station_city,
                rec.station_street,
                rec.station_house,
                rec.station_number
            	]
      end

    end.encode('WINDOWS-1250')
  end


end
