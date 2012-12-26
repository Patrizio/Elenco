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
    
    subject { Fabricate.build(:company) }
    
    it { should be_valid }
    
  end
 
  describe "Has a usable subdomain value" do 
        
    it "should be unique" do
      company1 = Fabricate(:company, :subdomain => "abc")
      company2 = Fabricate.build(:company, :subdomain => "abc")
      company2.should_not be_valid
      company2.should have(1).error_on(:subdomain)
    end
        
    it "should have only characters" do
      subject.subdomain = "ab@!"
      subject.should_not be_valid
    end
    
  end
  
end
