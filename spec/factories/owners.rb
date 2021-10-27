FactoryBot.define do
  factory :owner do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    birthdate { Faker::Date.birthday(max_age: 65, min_age: 18) }
    store
  end
end
