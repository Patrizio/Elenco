class RemoveEmployeeIdFromDepartments < ActiveRecord::Migration
  def up
    remove_column :departments, :employee_id
    add_column :employees, :company_id, :integer
  end

  def down
    add_column :departments, :employee_id, :integer
    remove_column :employees, :company_id
  end
end
