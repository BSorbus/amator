class AddLatitudeAndLongitudeToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :lat, :float
    add_column :clubs, :lng, :float
  end
end
