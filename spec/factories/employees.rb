FactoryBot.define do
  factory :employee do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    birthdate { Faker::Date.birthday(max_age: 40, min_age: 18) }
  end
end
