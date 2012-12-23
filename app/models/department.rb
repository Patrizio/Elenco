class Department < ActiveRecord::Base
  
  belongs_to :company
  has_many :employees
  
  attr_accessible :email, :extension, :name
  
  validates_presence_of :name, :extension, :email
  
end
