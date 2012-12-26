Fabricator(:department) do
  name { Faker::Company.name }
  extension { sequence(:extension, 1111) }
  email { Faker::Internet.email }
end
