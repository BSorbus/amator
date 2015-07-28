class Individual < ActiveRecord::Base

  def fullname
    "#{number}, #{call_sign}"
  end

  def self.to_csv
    CSV.generate(headers: false, col_sep: ';', converters: nil, skip_blanks: false, force_quotes: false) do |csv|
      columns_header = %w{department number valid_to call_sign category transmitter_power station_location }
      csv << columns_header
      all.each do |rec|
        csv << [
                rec.department.strip,
                rec.number.strip,
                rec.valid_to,
                rec.call_sign,
                rec.category,
                rec.transmitter_power,
                rec.station_location
            	]
      end

    end.encode('WINDOWS-1250')
  end


end
