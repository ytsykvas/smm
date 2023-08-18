When(/I visit (sign up|log in) page/) do |page|
  path = case page
         when 'sign up'
           new_user_registration_path
         when 'log in'
           new_user_session_path
         end
  visit path
end

When(/I fill "(.*?)" in the (.*?) field/) do |text, field_test_id|
  hash_of_data_test_id = {
    # Devise
    email: 'email-input',
    password: 'password-input',
    'password confirmation': 'password_confirmation-input'
  }.stringify_keys

  input_element = find("[data-test-id='#{hash_of_data_test_id[field_test_id.downcase]}']")
  input_element.fill_in(with: text)
end
