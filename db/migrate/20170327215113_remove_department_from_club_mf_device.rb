class RemoveDepartmentFromClubMfDevice < ActiveRecord::Migration
  def change
    remove_column :club_mf_devices, :department, :string
  end
end
