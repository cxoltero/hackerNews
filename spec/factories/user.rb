FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    about Faker::Lorem.paragraph(2)
    email Faker::Internet.email
  end
end
