class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :department
      t.string :number, index: true
      t.date :date_of_issue
      t.date :valid_to
      t.string :call_sign, index: true
      t.string :category
      t.integer :transmitter_power
      t.string :station_location, index: true

      t.timestamps null: false
    end
  end
end
