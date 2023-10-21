When(/I visit (.*?) page/) do |page|
  path = case page
         when 'sign up'
           new_user_registration_path
         when 'log in'
           new_user_session_path
         when 'positions'
           positions_path
         when 'new position'
           new_position_path
         end
  visit path
end

When(/I fill "(.*?)" in the (.*?) field/) do |text, field_test_id|
  hash_of_data_test_id = {
    # Devise
    email: 'email-input',
    password: 'password-input',
    'password confirmation': 'password_confirmation-input',
    # Position
    'position title': 'title_field',
    'position body': 'body_field',
    'position experience': 'experience_field'
  }.stringify_keys

  input_element = find("[data-test-id='#{hash_of_data_test_id[field_test_id.downcase]}']")
  input_element.fill_in(with: text)
end

When (/I click on the (.*?) (link|button)/) do |test_id, type|
  link_test_id = {
    # dashboard
  }
  button_test_id = {
    'submit': 'submit_button',
    # dashboard
    'avatar': 'avatar_picture',
    'sign out': 'log_out_button',
    'create position': 'create_position_btn'
  }.stringify_keys
  object = case type
           when "link"
             link_test_id[test_id.downcase]
           when "button"
             button_test_id["#{test_id.downcase}"]
           else
             "unknown test id"
           end
  find("[data-test-id='#{object}']").click
end

When(/^I submit the form$/) do
  find('input[type="submit"]').click
end
