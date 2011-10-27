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
  
  # Protect the following attributes from outside access
  attr_protected :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  
  # Validate the following fields and their specific requirements 
  validates_presence_of :firstname, :lastname, :title, :department, :extension
  validates_numericality_of :extension
  #validates_length_of :extension, :is => 4
  validates_uniqueness_of :extension,:mobile, :allow_blank => true
  
  # Each employee has a profile picture
  has_attached_file :avatar, :styles => { :small => "200x200" } 
  
  # Allow each employee to have tags of their skills
  acts_as_taggable_on :skills
  
  # Ensure a picture is being submitted
  # validates_attachment_presence(:avatar)
  # validates_attachment_size :avatar, :less_than => 5.megabytes  
  # validates_attachment_content_type :avatar, :content_type => ['image/jpeg']
  
  # The default way items are ordered/presented
  default_scope :order => 'extension'
  
  # Live search is performed on the columns specified here
  # questionmark operator indicates the ternary operator (IF-ELSE)
  scope :search_significant_fields, lambda { |q|
    (q ? where(["firstname LIKE ? or lastname LIKE ? or department LIKE ?", '%'+ q + '%', '%'+ q + '%', '%'+ q + '%']) | tagged_with('%' + q + '%'): {})
  }  

  # Virtual attribute to obtain a fullname
  def fullname
    [firstname, lastname].join(' ').force_encoding('utf-8')
  end
  
end



