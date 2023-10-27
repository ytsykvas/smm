FactoryBot.define do
  factory :candidate do
    name { Faker::Name.name }
    phone { "0#{rand((10**12) - (10**11)) + (10**11)}" }
    remotely { 'true' }
    email { Faker::Internet.email }
  end
end
