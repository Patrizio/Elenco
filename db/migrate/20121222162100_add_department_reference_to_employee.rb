class AddDepartmentReferenceToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :department_id, :integer
  end
end
