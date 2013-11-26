# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:username => 'MBrugh', :name => 'Michael Brughelli'}, {:username => 'SFlynn', :name => 'Sierra Flynn'}, {:username => 'PMahap', :name => 'Pattiya Mahapasuthanon'}, {:username => 'ASchwa', :name => 'Arnold Schwarzenegger' }, {:username => 'SStall', :name => 'Silvester Stallone'}, {:username => 'BWilli', :name => 'Bruce Willis'}, {:username => 'JHetfi', :name => 'James Hetfield'}, {:username => 'LUlric' , :name => 'Lars Ulrich'}, {:username => 'KHamme', :name => 'Kirk Hammet'},{:username => 'CBurto', :name => 'Cliff Burton'}]

users.each do |user|
  User.create!(user)
end
	
