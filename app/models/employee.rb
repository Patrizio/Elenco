class Employee < ActiveRecord::Base
  
  # Protect the following attributes from outside access
  attr_protected :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  # Validate the following fields and their specific requirements 
  validates_presence_of :firstname, :lastname, :title, :department, :extension, :email
  validates_numericality_of :extension
  #validates_length_of :extension, :is => 4
  validates_uniqueness_of :extension, :mobile, :allow_blank => true
  
  # Each employee has a profile picture
  has_attached_file :avatar, :styles => { :small => "200x200" } 
  
  # Allow each employee to have tags of their skills
  acts_as_taggable_on :skills
  
  searchable do
    text :firstname, :boost => 3.0
    text :lastname, :boost => 2.0
    text :department
    text :email
    text :title
    text :skills
    integer :extension
  end
  
  # Ensure a picture is being submitted
  # validates_attachment_presence(:avatar)
  # validates_attachment_size :avatar, :less_than => 5.megabytes  
  # validates_attachment_content_type :avatar, :content_type => ['image/jpeg']

  # Virtual attribute to obtain a fullname
  def fullname
    [firstname, lastname].join(' ').force_encoding('utf-8')
  end
  
end