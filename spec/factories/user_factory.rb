FactoryGirl.define do
  factory :user do |u|
    u.name { Faker::Name.name }
    u.username { Faker::Internet.user_name(u.name, %w(- _)) }
    u.email { Faker::Internet.free_email(u.name) }
    u.password { Faker::Internet.password }
    u.birthday { Faker::Date.between(80.years.ago, 5.years.ago) }
    u.gender { Gender::MALE }
    u.role { UserRole::REGULAR }
  end
  factory :female_user, parent: :user do
    gender { Gender::FEMALE }
  end
  factory :guest_user, parent: :user do
    role { UserRole::GUEST }
  end
  factory :root_user, parent: :user do
    role { UserRole::ROOT }
  end
  factory :confirmed_user, parent: :user do
    confirmed_at { DateTime.now }
    role { UserRole::ROOT }
  end
end
