class AddPrepositionToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :preposition, :string
  end
end
