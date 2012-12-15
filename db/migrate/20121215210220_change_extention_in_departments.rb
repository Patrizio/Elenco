class ChangeExtentionInDepartments < ActiveRecord::Migration
  def change
    rename_column :departments, :extention, :extension
  end
end
