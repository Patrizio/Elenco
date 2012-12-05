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
  
  describe "valid companies" do
    
    it "should allow characters as subdomains"
      @company_a = Fabricate(:company_a, :subdomain => '!!')
      
    end

  end
  
end
