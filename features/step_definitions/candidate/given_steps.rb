Given(/^For position number (\d+) we have (\d+) candidates$/) do |position, candidates|
  current_position = Position.find(position.to_i)
  candidates.to_i.times do
    FactoryBot.create(:candidate, position: current_position)
  end
  binding.irb
end
