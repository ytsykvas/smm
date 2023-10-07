FactoryBot.define do
  factory :company do
    user
    name { Faker::Company.name }
    information { Faker::Lorem.paragraph }
    started_at { Time.now.to_date }
    active { true }
    association :social, factory: :social
  end
end
