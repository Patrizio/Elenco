Fabricator(:employee) do
  firstname { Faker::Name.first_name }
  lastname { Faker::Name.last_name } 
  extension { sequence(:extension, 1111) }
  department 'Ruby coders'
  title 'Dev'
  email { Faker::Internet.email }
end
