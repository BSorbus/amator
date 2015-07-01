class AddLatitudeAndLongitudeToClubMfDevice < ActiveRecord::Migration
  def change
    add_column :club_mf_devices, :lat, :float
    add_column :club_mf_devices, :lng, :float
  end
end
