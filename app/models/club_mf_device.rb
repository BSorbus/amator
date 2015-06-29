class ClubMfDevice < ActiveRecord::Base

  def fullname
    "#{number}, #{call_sign}"
  end

  def self.to_csv
    CSV.generate(headers: false, col_sep: ';', converters: nil, skip_blanks: false, force_quotes: false) do |csv|
      columns_header = %w{department number date_of_issue valid_to call_sign category transmitter_power name_type_station emission input_frequency output_frequency operator_1 operator_2 operator_3 applicant_name applicant_city applicant_street applicant_house applicant_number enduser_name enduser_city enduser_street enduser_house enduser_number	station_city station_street station_house station_number }
      csv << columns_header
      all.each do |rec|
        csv << [
                rec.department.strip, 
                rec.number.strip,
                rec.date_of_issue, 
                rec.valid_to, 
                rec.call_sign,
                rec.category, 
                rec.transmitter_power, 
                rec.name_type_station, 
                rec.emission, 
                rec.input_frequency, 
                rec.output_frequency, 
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

