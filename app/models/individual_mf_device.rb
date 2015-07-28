class IndividualMfDevice < ActiveRecord::Base

  def fullname
    "#{number}, #{call_sign}"
  end

  def self.to_csv
    CSV.generate(headers: false, col_sep: ';', converters: nil, skip_blanks: false, force_quotes: false) do |csv|
      columns_header = %w{department number valid_to call_sign category transmitter_power name_type_station emission input_frequency output_frequency operator_1 operator_2 operator_3 station_location }
      csv << columns_header
      all.each do |rec|
        csv << [
                rec.department.strip,
                rec.number.strip,
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
                rec.station_location
            	]
      end

    end.encode('WINDOWS-1250')
  end


end

