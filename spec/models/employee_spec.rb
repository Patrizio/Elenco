require 'spec_helper'

describe Employee do
  
  it { should_not be_valid }
  
  it { should have(1).error_on(:firstname) }
  it { should have(1).error_on(:lastname) }
  it { should have(1).error_on(:title) }
  it { should have(1).error_on(:department) }
  
  context "after fabrication" do
    
    subject { Fabricate(:employee) }
    
    it { should be_valid }
    
  end

  describe ".fullname" do
    
    pending "should generate a fullname based on first and last name"
    
  end

  describe "#search_significant_fields" do
    
    before :all do
      @patrick = Fabricate(:employee, :firstname => 'Patrick', :lastname => 'Beeker', :department => 'Marketing')
      @marieke = Fabricate(:employee, :firstname => 'Marieke', :lastname => 'Van Tijn', :department => 'Marketing')
      @kunto = Fabricate(:employee, :firstname => 'Kunto', :lastname => 'Wibisono', :department => 'ICT')
      
    end
    
    it "should search by firstname" do
      results = Employee.search_significant_fields('Patrick')
      
      results.should include(@patrick)
      results.should_not include(@marieke)
    end
    
    it "should still return an employee if the firstname's case is not correct" do
      results = Employee.search_significant_fields('patrick')
      
      results.should include(@patrick)
      results.should_not include(@marieke)
    end
    
    it "should search by lastname" do
      results = Employee.search_significant_fields('Van Tijn')

      results.should include(@marieke)
      results.should_not include(@patrick)
    end 
    
    it "should return all employees of a department" do
      results = Employee.search_significant_fields('marketing')

      results.should include(@patrick, @marieke)
      results.should_not include(@kunto)
    end    
    
    pending "should search by a skill"
    
  end
  
end
