class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :department
      t.integer :extension
      t.string :mobile

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
