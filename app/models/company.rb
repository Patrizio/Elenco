class Company < ActiveRecord::Base
  
  has_many  :departments
  has_many  :employees,
            :through => :departments,
            :dependent => :destroy

  validates_presence_of :name, :phone, :address, :postalcode, :city, :country
  validates :subdomain, :presence => true, :uniqueness => true
   # Characters only, and at most one dash somewhere in the middle
  validates_format_of :subdomain, :with => /^[a-z\d]+([-_][a-z\d]+)*$/i
  
end
