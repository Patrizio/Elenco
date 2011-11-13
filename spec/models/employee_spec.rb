require 'spec_helper'

describe Employee do
  
  it { should_not be_valid }
  
  it { should have(1).error_on(:firstname) }
  it { should have(1).error_on(:lastname) }
  it { should have(1).error_on(:title) }
  it { should have(1).error_on(:department) }
  it { should have(1).error_on(:email) }
  
  context "after fabrication" do
    
    subject { Fabricate(:employee) }
    
    it { should be_valid }
    
  end

  describe ".fullname" do
    
    it "should generate a fullname based on first and last name" do
      @employee = Fabricate(:employee)
      
      fullname = @employee.fullname

      firstname = @employee.firstname
      lastname = @employee.lastname
      
      fullname.should == [firstname, lastname].join(' ')
      
    end
    
  end

  describe "#search_significant_fields" do
    
    before :all do
      @patrick = Fabricate(:employee, :firstname => 'Patrick', :lastname => 'Beeker', :department => 'Marketing', :skill_list => 'ruby, excel')
      @marieke = Fabricate(:employee, :firstname => 'Marieke', :lastname => 'Van Tijn', :department => 'Marketing', :skill_list => 'excel')
      @kunto = Fabricate(:employee, :firstname => 'Kunto', :lastname => 'Wibisono', :department => 'ICT', :skill_list => 'excel')
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
    
    it "should return all employees of a department" do
      results = Employee.search_significant_fields('marketing')

      results.should include(@patrick, @marieke)
      results.should_not include(@kunto)
    end    
    
    it "should return employees with a general skill" do
      results = Employee.search_significant_fields('excel')

      results.should include(@marieke, @patrick, @kunto)
    end
    
    it "should still return employees with a general skill when the case is not correct" do
      results = Employee.search_significant_fields('eXcel')

      results.should include(@marieke, @patrick, @kunto)
    end  
    
    it "should return employees with a relative unique skill" do
      results = Employee.search_significant_fields('ruby')

      results.should include(@patrick)
      results.should_not include(@kunto, @marieke)
    end
    
  end
  
end
