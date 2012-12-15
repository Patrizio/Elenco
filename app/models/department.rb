class Department < ActiveRecord::Base
  belongs_to :companies
  attr_accessible :email, :extention, :name
end
