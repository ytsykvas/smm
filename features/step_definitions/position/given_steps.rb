Given(/^We have (\d+) opened positions$/) do |count|
  FactoryBot.create_list(:position, count.to_i)
end

Given(/^We have (\d+) technologies$/) do |count|
  FactoryBot.create_list(:technology, count.to_i)
end
