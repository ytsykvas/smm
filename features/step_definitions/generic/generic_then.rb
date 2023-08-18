Then ('I click submit') do
  all('[type="submit"]').last.click
end

Then (/(After waiting max (\d*) seconds )?I (should see|should not see) the text: (.*)/) do |wait, see_or_not, key|
  hash_of_i18n_keys = {
    # Devise
    'sign up title': 'devise.registrations.new.title',
    'email field label': 'devise.registrations.new.email',
    'password field label': 'devise.registrations.new.password_confirmation',
    'success registration alert': 'devise.registrations.signed_up'
  }.stringify_keys
  text = I18n.t(hash_of_i18n_keys.fetch(key))
  wait ||= Capybara.default_max_wait_time
  if see_or_not == 'should see'
    expect(page).to have_content text, wait: wait.to_i
  else
    expect(page).to_not have_content text, wait: wait.to_i
  end
end
