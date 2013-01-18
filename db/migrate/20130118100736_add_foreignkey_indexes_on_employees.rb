class AddForeignkeyIndexesOnEmployees < ActiveRecord::Migration
  def up
  	add_index :employees, :company_id, :name => "index_employees_on_company"
  	add_index :employees, :department_id, :name => "index_employees_on_department"
  end

  def down
	remove_index :employees, :company_id, :name => "index_employees_on_company"
  	remove_index :employees, :department_id, :name => "index_employees_on_department"
  end
end
