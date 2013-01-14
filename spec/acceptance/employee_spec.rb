require 'acceptance/acceptance_helper'

feature "Employees" do
  
  background :all do
    @acme = Fabricate(:company)
    @patrick = Fabricate.build(:employee, :company_id => @acme.id, :firstname => 'Patrick', :lastname => 'Beeker', :email => 'p.beeker@stayokay.com')
  end
  
  background :each do
    visit '/nl'
  end

  it "displays the fullname as h1" do
    rendered.should have_selector 'h1',
          :text => '@employee.fullname',
          :count => 1
  end

  
end