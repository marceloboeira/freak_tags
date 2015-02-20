FactoryGirl.define do
  factory :news do |n|
    n.title { Faker::Lorem.sentence(3, true, 6)  }
    n.slug_line { Faker::Lorem.sentence(5, true, 6) }
    n.content { Faker::Lorem.paragraph(20) }
    n.state { State::ACTIVE }
    association :author, factory: :user
  end
end
