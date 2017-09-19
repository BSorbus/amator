class RemoveOperatorsFromIndividualMfDevice < ActiveRecord::Migration
  def change
    remove_column :individual_mf_devices, :operator_1, :string
    remove_column :individual_mf_devices, :operator_2, :string
    remove_column :individual_mf_devices, :operator_3, :string
  end
end
