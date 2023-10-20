Then(/^I (should|should not) see position number (\d+)$/) do |see_or_not, position_number|
  position = Position.find_by(id: position_number.to_i)
  if see_or_not == 'should' && position.present?
    expect(page).to have_content(position.title) if position.present?
  else
    if position.present?
      expect(page).not_to have_content(position.title)
    else
      true
    end
  end
end


Then(/^(I should|should not) see "(.*?)"$/) do |should_see, content|
  if should_see == 'I should'
    expect(page).to have_content(content)
  else
    expect(page).not_to have_content(content)
  end
end
