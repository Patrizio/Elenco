require 'spec_helper'

describe "employees/show.html.haml" do
  
 	background :each do
    	visit '/nl/companies/1/'
  	end

  	before(:each) do
    	@employee = Fabricate.build(:employee)
  	end

  it "displays the fullname as h1" do

	rendered.should have_selector 'h1',
         	:text => '@employee.fullname',
         	:count => 1
  end
end
