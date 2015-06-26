class CreateClubMfDevices < ActiveRecord::Migration
  def change
    create_table :club_mf_devices do |t|
      t.string :department, index: true
      t.string :number, index: true
      t.date :date_of_issue
      t.date :valid_to
      t.string :call_sign, index: true
      t.string :category
      t.integer :transmitter_power
      t.string :name_type_station, index: true
      t.string :emission
      t.string :input_frequency
      t.string :output_frequency
      t.string :operator_1, index: true
      t.string :operator_2, index: true
      t.string :operator_3, index: true
      t.string :enduser_name, index: true
      t.string :enduser_city
      t.string :enduser_street
      t.string :enduser_house
      t.string :enduser_number
      t.string :applicant_name, index: true
      t.string :applicant_city
      t.string :applicant_street
      t.string :applicant_house
      t.string :applicant_number
      t.string :station_city, index: true
      t.string :station_street
      t.string :station_house
      t.string :station_number

      t.timestamps null: false
    end
  end
end
