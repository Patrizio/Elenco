require 'spec_helper'

describe "companies/edit.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :phone => "MyString",
      :address => "MyString",
      :postalcode => "MyString",
      :city => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
      assert_select "input#company_phone", :name => "company[phone]"
      assert_select "input#company_address", :name => "company[address]"
      assert_select "input#company_postalcode", :name => "company[postalcode]"
      assert_select "input#company_city", :name => "company[city]"
      assert_select "input#company_country", :name => "company[country]"
    end
  end
end
