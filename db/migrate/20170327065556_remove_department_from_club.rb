class RemoveDepartmentFromClub < ActiveRecord::Migration
  def change
    remove_column :clubs, :department, :string
  end
end
