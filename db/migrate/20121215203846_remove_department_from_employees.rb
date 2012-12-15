class RemoveDepartmentFromEmployees < ActiveRecord::Migration
  def up
    remove_column :employees, :department
  end

  def down
    add_column :employees, :department
  end
end
