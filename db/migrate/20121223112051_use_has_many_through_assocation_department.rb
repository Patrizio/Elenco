class UseHasManyThroughAssocationDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :employee_id, :integer
    remove_column :employees,  :company_id
    remove_column :employees, :department_id
  end
end
