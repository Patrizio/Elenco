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
  
end
