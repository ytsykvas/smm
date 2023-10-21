Then ('I click submit') do
  all('[type="submit"]').last.click
end

Then (/(After waiting max (\d*) seconds )?I (should see|should not see) the text: (.*)/) do |wait, see_or_not, key|
  hash_of_i18n_keys = {
    # Devise
    'sign up title': 'devise.registrations.new.title',
    'email field label': 'devise.registrations.new.email',
    'password field label': 'devise.registrations.new.password_confirmation',
    'success registration alert': 'devise.registrations.signed_up',
    'signed in alert': 'devise.sessions.signed_in',
    'forgot password': 'devise.shared_links.forgot_password',
    'Signed out': 'devise.sessions.already_signed_out',
    # navbar
    'agency': 'navbar.agency',
    'partners': 'navbar.partners',
    'services': 'navbar.services',
    'careers': 'navbar.vacancies',
    'message': 'navbar.message',
    # navbar dropdown
    'projects': 'navbar.admin.projects',
    'statistic': 'navbar.manager.statistic',
    'teams': 'navbar.admin.teams',
    'tasks': 'navbar.manager.teams',
    'salary': 'navbar.manager.salary',
    'employees': 'navbar.admin.employees',
    'salaries': 'navbar.admin.salaries',
    'finances': 'navbar.admin.finances',
    'board': 'navbar.admin.board',
    'settings': 'navbar.admin.settings',
    'log out': 'navbar.log_out',
    'employee statistic': 'navbar.employee.statistic',
    'employee salary': 'navbar.employee.finances',
    'employee my team': 'navbar.employee.my_team',
    'employee my tasks': 'navbar.employee.my_tasks',
    'ask question': 'navbar.regular.question',
    'calculate': 'navbar.regular.calculate',
    # positions
    'no opened positions': 'positions.no_opened_positions',
    'create position title': 'positions.create_position_title',
    'create new position': 'positions.open_new_position',
    'position is created': 'positions.created_position_notice',
    'edit position title': 'positions.edit_position_title',
    'updated position notice': 'positions.updated_position_notice'
  }.stringify_keys
  text = I18n.t(hash_of_i18n_keys.fetch(key))
  wait ||= Capybara.default_max_wait_time
  if see_or_not == 'should see'
    expect(page).to have_content text, wait: wait.to_i
  else
    expect(page).to_not have_content text, wait: wait.to_i
  end
end

Then(/^I see text: (.+)/) do |text|
  expect(page).to have_text(text)
end

Then('I confirm alert') do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I (should|should not) see pagination$/) do |should_or_not|
  if should_or_not == 'should'
    expect(page).to have_selector('.pagination')
  else
    expect(page).not_to have_selector('.pagination')
  end
end
