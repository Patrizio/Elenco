class Company < ActiveRecord::Base
  has_many :employees, :dependent => :destroy

  validates_presence_of :name, :phone, :address, :postalcode, :city, :country
  validates :subdomain, :presence => true, :uniqueness => true
  validates_format_of :subdomain, :with => /^[\w\d\s]+-?[\w\d\s]*$/ # Characters only, and at most one dash somewhere in the middle
  
end
