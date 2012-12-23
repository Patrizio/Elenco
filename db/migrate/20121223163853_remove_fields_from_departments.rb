class RemoveFieldsFromDepartments < ActiveRecord::Migration
  def up
    remove_column :departments, :name
    remove_column :departments, :email
    remove_column :departments, :extension
    remove_column :departments, :employee_id
  end

  def down
    add_column :departments, :name
    add_column :departments, :email
    add_column :departments, :extension
    add_column :departments, :employee_id
  end
end
