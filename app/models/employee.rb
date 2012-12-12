class Employee < ActiveRecord::Base
  
  belongs_to :company
  
  # Protect the following attributes from outside access
  attr_protected :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  
  # Validate the following fields and their specific requirements 
  validates_presence_of :firstname, :lastname, :title, :department, :email
  validates :extension, :uniqueness => true, :numericality => true, :allow_blank => true
  validates :mobile, :uniqueness => true, :allow_blank => true
  
  # Each employee has a profile picture
  has_attached_file :avatar, 
                    :default_url => '/assets/profile-head.gif',
                    :styles => { :small => "200x200" } 
                    
  # Allow each employee to have tags of their skills
  acts_as_taggable_on :skills
 
  # The default way items are ordered/presented
  default_scope :order => 'extension'
  
  # Live search is performed on the columns specified here
  # questionmark operator indicates the ternary operator (IF-ELSE)
  scope :search_significant_fields, lambda { |q|
    (q ? where(["lower(firstname) LIKE ? or lower(lastname) LIKE ? or lower(department) LIKE ? or extension = ?", '%'+ q.downcase + '%', '%'+ q.downcase + '%', '%'+ q.downcase + '%', q.to_i]) | tagged_with(q): {})
  }  

  # Virtual attribute to obtain a fullname
  def fullname
    [firstname, lastname].join(' ').force_encoding('utf-8')
  end
  
end