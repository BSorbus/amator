#
class IndividualDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  # include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def_delegators :@view, :link_to, :h, :mailto

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= %w(Individual.number
                             Individual.valid_to
                             Individual.call_sign
                             Individual.category
                             Individual.transmitter_power
                             Individual.station_location)
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= %w(Individual.number
                               Individual.valid_to
                               Individual.call_sign
                               Individual.category
                               Individual.transmitter_power
                               Individual.station_location)
  end

  private

  def data
    records.map do |record|
      [record.id,
       record.number,
       record.valid_to,
       record.call_sign,
       record.category,
       record.transmitter_power,
       record.station_location]
    end
  end

  def get_raw_records
    Individual.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
