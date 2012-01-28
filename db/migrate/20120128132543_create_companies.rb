class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :postalcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
