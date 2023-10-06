FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'blink182' }
    password_confirmation { 'blink182' }
    user_type { 'admin' }
  end
end
