class ChangeCompaniesIdInDepartments < ActiveRecord::Migration
  def change
    rename_column :departments, :companies_id, :company_id
  end
end
