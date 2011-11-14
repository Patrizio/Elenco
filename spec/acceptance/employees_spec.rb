require 'acceptance/acceptance_helper'

feature "Employees" do
  
  background :all do
    @patrick = Fabricate(:employee, :firstname => 'Patrick', :lastname => 'Beeker', :department => 'Marketing', :email => 'p.beeker@stayokay.com')
    @marieke = Fabricate(:employee, :firstname => 'Marieke', :lastname => 'van Tijn', :department => 'Developer', :email => 'm.vantijn@stayokay.com')
    @kunto = Fabricate(:employee, :firstname => 'Kunto', :lastname => 'Wibisono', :department => 'ICT', :email => 'k.wibisono@stayokay.com')
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
    page.should have_no_content 'Kunto Wibisono'
  end
  
  
  scenario "get details on single employee" do
    fill_in 'search', :with => 'Patrick'
    find("div.employee").click
    
    page.should have_content 'p.beeker@stayokay.com'
  end
  
end
