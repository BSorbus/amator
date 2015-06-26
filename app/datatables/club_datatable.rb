class ClubDatatable < AjaxDatatablesRails::Base
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
                              Club.department 
                              Club.number 
                              Club.date_of_issue 
                              Club.valid_to 
                              Club.call_sign 
                              Club.category 
                              Club.transmitter_power 
                              Club.operator_1 
                              Club.operator_2 
                              Club.operator_3 
                              Club.station_city 
                              Club.applicant_name 
                          )
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= %w(
                              Club.department 
                              Club.number 
                              Club.date_of_issue 
                              Club.valid_to 
                              Club.call_sign 
                              Club.category 
                              Club.transmitter_power 
                              Club.operator_1 
                              Club.operator_2 
                              Club.operator_3 
                              Club.station_city 
                              Club.applicant_name 
                            )
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.department, 
        record.number,
        record.date_of_issue,
        record.valid_to,
        record.call_sign,
        record.category,
        record.transmitter_power,       
        record.operator_1, 
        record.operator_2, 
        record.operator_3, 
        record.station_city, 
        record.applicant_name 
      ]
    end
  end

  def get_raw_records
    Club.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
