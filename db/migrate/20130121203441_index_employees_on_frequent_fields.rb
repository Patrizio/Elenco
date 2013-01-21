class IndexEmployeesOnFrequentFields < ActiveRecord::Migration
  def up
  	add_index :employees, :firstname, :name => "index_employees_on_firstname"
  	add_index :employees, :lastname, :name => "index_employees_on_lastname"
  	add_index :employees, :extension, :name => "index_employees_on_extension"
  end

  def down
	remove_index :employees, :firstname, :name => "index_employees_on_firstname"
  	remove_index :employees, :lastname, :name => "index_employees_on_lastname"
  	remove_index :employees, :extension, :name => "index_employees_on_extension"
  end
end
