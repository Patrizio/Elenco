class Company < ActiveRecord::Base
  has_many :employees, :dependent => :destroy

  validates_presence_of :name, :phone, :address, :postalcode, :city, :country
  validates :subdomain, :presence => true, :uniqueness => true
  
end
