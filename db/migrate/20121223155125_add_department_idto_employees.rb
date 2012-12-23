class AddDepartmentIdtoEmployees < ActiveRecord::Migration
  def up
    add_column :employees, :department_id, :integer
  end

  def down
    remove_column :employees, :department_id, :integer
  end
end
