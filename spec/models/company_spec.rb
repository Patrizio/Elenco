require 'spec_helper'

describe Company do
  
  it { should_not be_valid }
  
  it { should have(1).error_on(:name) }
  it { should have(2).error_on(:subdomain) }
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
      @company = Fabricate.build(:company)
    end
 
    it "should have an unique subdomain name" do
      c = Fabricate.build(:company, :subdomain => @company.subdomain)
      c.should_not be_valid
    end
      
    it "should have only characters for a subdomain" do
      @company.subdomain = "domainwithstrangecharacters@!"
      @company.should_not be_valid
    end
    
  end
  
end
