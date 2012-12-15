class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :email
      t.integer :extention
      t.references :companies

      t.timestamps
    end
    add_index :departments, :companies_id
  end
end
