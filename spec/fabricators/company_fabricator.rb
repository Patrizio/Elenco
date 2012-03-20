Fabricator(:company) do
  name { Faker::Company.name }
  subdomain { Faker::Company.name } 
  phone { Faker::PhoneNumber.phone_number } 
  address { Faker::Address.street_address }
  postalcode { Faker::Address.postcode }
  city { Faker::Address.city }
  country { Faker::Address.country }
end
