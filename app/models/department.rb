class Department < ActiveRecord::Base
  
  belongs_to :company
  has_many :employees
  
  attr_accessible :email, :extension, :name
  
  validates_presence_of :name, :company
  validates_uniqueness_of :name, :scope => [:company_id]
  
end
