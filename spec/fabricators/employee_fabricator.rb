Fabricator(:employee) do
  	firstname { Faker::Name.first_name }
  	lastname { Faker::Name.last_name } 
  	extension { sequence(:extension, 1111) }
  	title { Faker::Name.title }
  	email { Faker::Internet.email }
end
