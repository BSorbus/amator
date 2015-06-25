class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :department
      t.string :number, index: true
      t.date :date_of_issue
      t.date :valid_to
      t.string :call_sign, index: true
      t.string :category
      t.integer :transmitter_power
      t.string :operator_1, index: true
      t.string :operator_2, index: true
      t.string :operator_3, index: true
      t.string :enduser_name, index: true
      t.string :enduser_city, index: true
      t.string :enduser_street
      t.string :enduser_house
      t.string :enduser_number
      t.string :applicant_name, index: true
      t.string :applicant_city, index: true
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
