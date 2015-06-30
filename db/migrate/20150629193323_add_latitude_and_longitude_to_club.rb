class AddLatitudeAndLongitudeToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :lat, :decimal
    add_column :clubs, :lng, :decimal
  end
end
