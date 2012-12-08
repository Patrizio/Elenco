require 'spec_helper'

describe Company do
  
  it { should_not be_valid }
  
  it { should have(1).error_on(:name) }
  it { should have(1).error_on(:subdomain) }
  it { should have(1).error_on(:phone) }
  it { should have(1).error_on(:postalcode) }
  it { should have(1).error_on(:address) }
  it { should have(1).error_on(:city) }
  it { should have(1).error_on(:country) }
  
  context "after fabrication" do
    
    subject { Fabricate(:company) }
    
    it { should be_valid }
    
  end
 
 
  describe "#test_subdomain" do
    
    before :all do
      @company_a = Fabricate(:company)
    end
 
    it "should have an unique subdomain name" do
      c = Fabricate.build(:company, :subdomain => @company_a.subdomain)
      c.should_not be_valid
    end
      
    it "should have only characters for a subdomain" do
  
    end
    
  end
  
end
