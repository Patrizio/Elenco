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
  validates_uniqueness_of :mobile, :extension
  
  scope :search_by_all_fields, lambda { |q|
    (q ? where(["firstname LIKE ? or lastname LIKE ? or title LIKE ? or department LIKE ? or extension LIKE ? or mobile LIKE ?", '%'+ q + '%', '%'+ q + '%', '%'+ q + '%', '%'+ q + '%', '%'+ q + '%', '%'+ q + '%'])  : {})
  }  

end



