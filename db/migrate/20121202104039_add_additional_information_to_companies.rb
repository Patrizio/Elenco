class AddAdditionalInformationToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :fax_number, :string
    add_column :companies, :po_box, :string
  end
end
