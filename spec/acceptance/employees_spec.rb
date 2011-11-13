require 'acceptance/acceptance_helper'

feature "Employees" do
  
  background :all do
    @patrick = Fabricate(:employee, :firstname => 'Patrick', :lastname => 'Beeker', :department => 'Marketing', :email => 'p.beeker@stayokay.com')
    @marieke = Fabricate(:employee, :firstname => 'Marieke', :lastname => 'van Tijn', :department => 'Developer', :email => 'm.vantijn@stayokay.com')
  end
  
  background :each do
    visit '/nl'
  end
  
  scenario "view all employees on the root page" do
    page.should have_content 'Patrick Beeker'
    page.should have_content 'Marieke van Tijn'
  end
  
  scenario "search for an employee" do
    fill_in 'search', :with => 'Patrick'
    
    page.should have_content 'Patrick Beeker'
    page.should have_no_content 'Marieke van Tijn'
  end
  
end
