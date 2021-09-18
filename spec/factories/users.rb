FactoryBot.define do
  factory :user do
    email { 'millan@getnada.com' }
    birthdate { '1996-12-30' }
    password_digest { 'Superapss!' }
    type { 'test' }
  end
end
