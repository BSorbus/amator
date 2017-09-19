class RemoveDepartmentFromIndividualMfDevice < ActiveRecord::Migration
  def change
    remove_column :individual_mf_devices, :department, :string
  end
end
