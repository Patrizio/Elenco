Fabricator(:employee) do
  firstname { Faker::Name.first_name }
  lastname { Faker::Name.last_name } 
  extension '1234'
  department 'Ruby coders'
  title 'Dev'
end
