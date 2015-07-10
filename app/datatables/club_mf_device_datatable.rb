class ClubMfDeviceDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  # include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def_delegators :@view, :link_to, :h, :mailto

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= %w( 
                              ClubMfDevice.department 
                              ClubMfDevice.number 
                              ClubMfDevice.valid_to 
                              ClubMfDevice.call_sign 
                              ClubMfDevice.category 
                              ClubMfDevice.transmitter_power 
                              ClubMfDevice.name_type_station 
                              ClubMfDevice.emission 
                              ClubMfDevice.input_frequency 
                              ClubMfDevice.output_frequency 
                              ClubMfDevice.operator_1 
                              ClubMfDevice.operator_2 
                              ClubMfDevice.operator_3 
                              ClubMfDevice.station_city 
                              ClubMfDevice.applicant_name 
                          )
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= %w(
                              ClubMfDevice.department 
                              ClubMfDevice.number 
                              ClubMfDevice.valid_to 
                              ClubMfDevice.call_sign 
                              ClubMfDevice.category 
                              ClubMfDevice.transmitter_power 
                              ClubMfDevice.name_type_station 
                              ClubMfDevice.emission 
                              ClubMfDevice.input_frequency 
                              ClubMfDevice.output_frequency 
                              ClubMfDevice.operator_1 
                              ClubMfDevice.operator_2 
                              ClubMfDevice.operator_3 
                              ClubMfDevice.station_city 
                              ClubMfDevice.applicant_name 
                            )
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.department, 
        record.number,
        record.valid_to,
        record.call_sign,
        record.category,
        record.transmitter_power,       
        record.name_type_station, 
        record.emission, 
        record.input_frequency, 
        record.output_frequency, 
        record.operator_1, 
        record.operator_2, 
        record.operator_3, 
        record.station_city, 
        record.applicant_name 
      ]
    end
  end

  def get_raw_records
    ClubMfDevice.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
