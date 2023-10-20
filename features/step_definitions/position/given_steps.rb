Given(/^We have (\d+) opened positions$/) do |count|
  FactoryBot.create_list(:position, count.to_i)
end
