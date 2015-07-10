class IndividualMfDeviceDatatable < AjaxDatatablesRails::Base
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
                              IndividualMfDevice.department 
                              IndividualMfDevice.number 
                              IndividualMfDevice.valid_to 
                              IndividualMfDevice.call_sign 
                              IndividualMfDevice.category 
                              IndividualMfDevice.transmitter_power 
                              IndividualMfDevice.name_type_station 
                              IndividualMfDevice.emission 
                              IndividualMfDevice.input_frequency 
                              IndividualMfDevice.output_frequency 
                              IndividualMfDevice.operator_1 
                              IndividualMfDevice.operator_2 
                              IndividualMfDevice.operator_3 
                              IndividualMfDevice.station_location 
                          )
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= %w(
                              IndividualMfDevice.department 
                              IndividualMfDevice.number 
                              IndividualMfDevice.valid_to 
                              IndividualMfDevice.call_sign 
                              IndividualMfDevice.category 
                              IndividualMfDevice.transmitter_power 
                              IndividualMfDevice.name_type_station 
                              IndividualMfDevice.emission 
                              IndividualMfDevice.input_frequency 
                              IndividualMfDevice.output_frequency 
                              IndividualMfDevice.operator_1 
                              IndividualMfDevice.operator_2 
                              IndividualMfDevice.operator_3 
                              IndividualMfDevice.station_location 
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
        record.station_location 
      ]
    end
  end

  def get_raw_records
    IndividualMfDevice.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
