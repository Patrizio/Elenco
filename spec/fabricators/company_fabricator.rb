Fabricator(:company) do
  name { Faker::Company.name }
  subdomain { Faker::Company.name } 
  phone { Faker::PhoneNumber.phone_number }
  fax_number { Faker::PhoneNumber.phone_number } 
  address { Faker::Address.street_address }
  postalcode { Faker::Address.postcode }
  po_box { sequence(:po_box, 11111 ) }
  city { Faker::Address.city }
  country { Faker::Address.country }
end
