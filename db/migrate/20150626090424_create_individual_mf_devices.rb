class CreateIndividualMfDevices < ActiveRecord::Migration
  def change
    create_table :individual_mf_devices do |t|
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
      t.string :station_location, index: true

      t.timestamps null: false
    end
  end
end
