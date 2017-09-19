class RemoveOperatorsFromClub < ActiveRecord::Migration
  def change
    remove_column :clubs, :operator_1, :string
    remove_column :clubs, :operator_2, :string
    remove_column :clubs, :operator_3, :string
  end
end
