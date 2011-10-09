# == Schema Information
#
# Table name: employees
#
#  id                  :integer         not null, primary key
#  firstname           :string(255)
#  lastname            :string(255)
#  title               :string(255)
#  department          :string(255)
#  extension           :integer
#  mobile              :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Employee < ActiveRecord::Base
  
  # Validate the following fields and their specific requirements 
  validates_presence_of :firstname, :lastname, :title, :department, :extension
  validates_numericality_of :extension
  validates_length_of :extension, :is => 4
  validates_uniqueness_of :extension,:mobile, :allow_blank => true
  
  # Each employee has a profile picture
  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "200x200", :thumb => "100x100>" } 
  
  # The default way items are ordered/presented
  default_scope :order => 'extension'
  
  # Live search is performed on the columns specified here
  scope :search_significant_fields, lambda { |q|
    (q ? where(["firstname LIKE ? or lastname LIKE ? or department LIKE ?", '%'+ q + '%', '%'+ q + '%', '%'+ q + '%'])  : {})
  }  

  # Virtual attribute to obtain a fullname
  def fullname
    [firstname, lastname].join(' ')
  end
  
end



