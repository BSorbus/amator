class AddLatitudeAndLongitudeToClubMfDevice < ActiveRecord::Migration
  def change
    add_column :club_mf_devices, :lat, :decimal
    add_column :club_mf_devices, :lng, :decimal
  end
end
