Fabricator(:department) do
  name { Faker::Company.name }
  email { Faker::Internet.email }
  extension { sequence(:extension, 1111) }
end
