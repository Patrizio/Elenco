class Department < ActiveRecord::Base
  belongs_to :companies
  attr_accessible :email, :extention, :name
  
  validates_presence_of :name, :extension, :email
  
end
