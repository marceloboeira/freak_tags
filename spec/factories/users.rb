require 'faker'

FactoryGirl.define do
  factory :user do |u|
    u.name { Faker::Name.name }
    u.username { Faker::Internet.user_name(u.name) }
    u.email { Faker::Internet.free_email(u.name) }
    u.birthday { Faker::Date.between(80.years.ago, 5.years.ago) }
    u.sex { Sex::MALE }
  end
end
