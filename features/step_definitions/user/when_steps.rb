When(/^The last user fill his email and password$/) do
  input_element = find("[data-test-id='email-input']")
  input_element.fill_in(with: User.last.email)
  input_element = find("[data-test-id='password-input']")
  input_element.fill_in(with: 'blink182')
end
