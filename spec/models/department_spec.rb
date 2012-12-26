require 'spec_helper'

describe Department do
  
  it { should_not be_valid }
  
  it { should have(1).error_on(:name) }
  it { should have(1).error_on(:email) }
  it { should have(1).error_on(:extension) }

  
  context "after fabrication" do
    
    subject { Fabricate.build(:department) }
    
    it { should be_valid }
    
  end

end

