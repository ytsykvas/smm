When(/I check the checkbox with technology number (\d+)/) do |technology_id|
  checkbox = find("[data-test-id='technology_#{technology_id.to_i}']")
  checkbox.click
end
