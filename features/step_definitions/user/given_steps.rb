Given(/^We have a logged in user. It is (.*?)$/) do |user_type|
  visit new_user_registration_path
  input_element = find("[data-test-id='email-input']")
  input_element.fill_in(with: Faker::Internet.email)
  input_element = find("[data-test-id='password-input']")
  input_element.fill_in(with: 'blink182')
  input_element = find("[data-test-id='password_confirmation-input']")
  input_element.fill_in(with: 'blink182')
  find('input[type="submit"]').click
  User.last.update(user_type:)
  visit current_url
end

Given(/^We have a user. It is (.*?)$/) do |user_type|
  @user = FactoryBot.create(:user, user_type:)
end
