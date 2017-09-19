class RemoveOperatorsFromClubMfDevice < ActiveRecord::Migration
  def change
    remove_column :club_mf_devices, :operator_1, :string
    remove_column :club_mf_devices, :operator_2, :string
    remove_column :club_mf_devices, :operator_3, :string
  end
end
