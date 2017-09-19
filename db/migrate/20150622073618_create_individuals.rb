class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :department, index: true
      t.string :number, index: true,            limit: 160, null: false, default: ""
      t.date :date_of_issue
      t.date :valid_to
      t.string :call_sign, index: true,         limit: 50, null: false, default: ""
      t.string :category,                       limit: 50, null: false, default: ""
      t.integer :transmitter_power
      t.string :station_location, index: true,  limit: 160, null: false, default: ""

      t.timestamps null: false
    end
  end
end
