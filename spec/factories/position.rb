FactoryBot.define do
  factory :position do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    closing_date { Faker::Date.forward(days: 30) }
    experience { Faker::Number.between(from: 1, to: 10) }

    after(:build) do |position|
      technologies = FactoryBot.create_list(:technology, 10)
      position.technologies = technologies.sample(rand(1..10))
    end
  end
end
