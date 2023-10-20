FactoryBot.define do
  factory :technology do
    name { Faker::ProgrammingLanguage.name }
  end
end
