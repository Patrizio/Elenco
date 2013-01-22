# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

stayokay = Company.create({ 
	:name => 'Stayokay', 
	:subdomain => 'stayokay', 
	:phone => '020-12345678',
	:fax_number => '',
	:address => 'Timorplein 21',
	:postalcode => '1234 AB',
	:po_box => '12345',
	:city => 'Amsterdam',
	:country => 'the Netherlands'})

saatchi = Company.create({ 
	:name => 'Saatchi & Saatchi', 
	:subdomain => 'saatchi', 
	:phone => '020-12345678',
	:fax_number => '',
	:address => 'Danzigerkade 23c',
	:postalcode => '1234 AB',
	:po_box => '12345',
	:city => 'Amsterdam',
	:country => 'the Netherlands'})