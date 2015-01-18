# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username=>'root', :email=>'root@freaktags.com', :name => 'FreakTags', :birthday => Date.parse('1994-03-07'), :gender => Gender::MALE)
User.create(:username=>'test', :email=>'test@freaktags.com', :name => 'FreakTests', :birthday => Date.parse('1996-02-16'), :gender => Gender::FEMALE)
