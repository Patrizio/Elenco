class Employee < ActiveRecord::Base
  
  belongs_to :company
  belongs_to :department
  
  #TODO: Check if department associated belongs to the same company as the employee

  accepts_nested_attributes_for :department

  # Protect the following attributes from outside access
  attr_protected :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  
  # Validate the following fields and their specific requirements 
  # TODO: Check uniqueness on Company level (email, extension, mobile)
  validates_presence_of :firstname, :lastname, :email
  validates :extension, :presence => true, :numericality => true
  
  # Each employee has a profile picture
  has_attached_file :avatar, 
                    :default_url => '/assets/profile-head-100.png',
                    :styles => { :small => "100x100" } 
                    
  # Allow each employee to have tags of their skills
  acts_as_taggable_on :skills
 
  # The default order
  default_scope :order => 'extension'
  
  # Live search is performed on the columns specified here
  # questionmark operator indicates the ternary operator (IF-ELSE)
  
  # TODO - search on department
  scope :search_significant_fields, lambda { |q|
    (q ? where(["lower(firstname) LIKE ? or lower(lastname) LIKE ? or extension = ?", '%'+ q.downcase + '%', '%'+ q.downcase + '%', q.to_i]) | tagged_with(q.downcase): {})
  }  

  # Virtual attribute to obtain a fullname
  def fullname
    [firstname, preposition, lastname].join(' ').force_encoding('utf-8')
  end
  
end