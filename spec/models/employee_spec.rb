require 'spec_helper'

describe Employee do
  
  it { should_not be_valid }
  
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:extension) }
  it { should validate_presence_of(:email) }
    
  context "after fabrication" do
    
    subject { Fabricate.build(:employee) }
    
    it { should be_valid }
    
  end


  describe ".fullname" do
    
    it "should generate a fullname based on first and last name" do
      @employee = Fabricate.build(:employee)
      
      fullname = @employee.fullname

      firstname = @employee.firstname
      lastname = @employee.lastname
      
      fullname.should == [firstname, lastname].join(' ')
      
    end
    
  end

  describe "#search_significant_fields" do
    
    before :all do
      my_company = Fabricate(:company, :subdomain => "unique")
      marketing_department = my_company.departments.create!(:name => "marketing", :email => "marketing@stayokay.com", :extension => 1234)
      tech_department = my_company.departments.create!(:name => "tech", :email => "ict@stayokay.com", :extension => 4321)
      @patrick = Fabricate(:employee, :firstname => 'Patrick', :lastname => 'Beeker', :extension => 9125, :department => marketing_department, :email => 'p.beeker@stayokay.com', :skill_list => 'ruby, excel', :company => my_company)
      @marieke = Fabricate(:employee, :firstname => 'Marieke', :lastname => 'Van Tijn', :extension => 9123, :department => marketing_department, :email => 'm.vantijn@stayokay.com',:skill_list => 'excel', :company => my_company)
      @kunto = Fabricate(:employee, :firstname => 'Kunto', :lastname => 'Wibisono', :extension => 9182, :department => tech_department, :email => 'k.wibisono@stayokay.com', :skill_list => 'excel', :company => my_company)
    end
    
    it "should search by firstname" do
      results = Employee.search_significant_fields('Patrick')
      results.should include(@patrick)
      results.should_not include(@marieke, @kunto)
    end
    
    it "should still return an employee if the firstname's case is not correct" do
      results = Employee.search_significant_fields('PATRICK')
      results.should include(@patrick)
      results.should_not include(@marieke, @kunto)
    end
    
    it "should search by lastname" do
      results = Employee.search_significant_fields('Van Tijn')
      results.should include(@marieke)
      results.should_not include(@patrick, @kunto)
    end 
    
    it "should return all employees of a department" 

    it "should return all employees of a department in wrong case" 
    
    it "should return employees with a general skill" do
      results = Employee.search_significant_fields('excel')
      results.should include(@marieke, @patrick, @kunto)
    end
    
    it "should still return employees with a general skill when the case is not correct" do
      results = Employee.search_significant_fields('eXcel')
      results.should include(@marieke, @patrick, @kunto)
    end  
    
    it "should return employees with an unique skill" do
      results = Employee.search_significant_fields('ruby')
      results.should include(@patrick)
      results.should_not include(@kunto, @marieke)
    end
    
    it "should return employee with partial word of a unique skill is entered" 
    
    it "should still return an employee by extension" do
      results = Employee.search_significant_fields('9123')     
      results.should include(@marieke)
      results.should_not include(@patrick, @kunto)
    end
    
  end
  
end
