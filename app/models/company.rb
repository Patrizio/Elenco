class Company < ActiveRecord::Base
  has_many :employees, :dependent => :destroy

  # Validate the following fields and their specific requirements 
  # validates_presence_of :firstname, :lastname, :title, :department, :extension, :email

end
