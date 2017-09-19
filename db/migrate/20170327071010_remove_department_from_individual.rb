class RemoveDepartmentFromIndividual < ActiveRecord::Migration
  def change
    remove_column :individuals, :department, :string
  end
end
