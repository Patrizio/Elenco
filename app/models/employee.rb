# == Schema Information
#
# Table name: employees
#
#  id         :integer         not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  title      :string(255)
#  department :string(255)
#  extension  :integer
#  mobile     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Employee < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :title, :department, :extension
  validates_numericality_of :extension
  validates_length_of :extension, :is => 4
  validates_uniqueness_of :extension
  
  scope :search_significant_fields, lambda { |q|
    (q ? where(["firstname LIKE ? or lastname LIKE ?", '%'+ q + '%', '%'+ q + '%'])  : {})
  }  

end



