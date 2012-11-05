# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "START SEEDING DB"
puts "Seeding companies..."
Company.create(name: 'Stayokay', subdomain: 'stayokay', phone: '020-12345678', address: 'Timorplein 21a', postalcode: '1099CC', city: 'Amsterdam', country: 'The Netherlands')
Company.create(name: 'Mangrove', subdomain: 'mangrove', phone: '010-12345678', address: 'Schiekade 12', postalcode: '1299CC', city: 'Rotterdam', country: 'The Netherlands')
puts "DONE...SEEDING DB"