Feature: Different user types have different user dropdowns

  Scenario: Admin user
    Given We have a user. It is admin
    When I visit log in page
    And The last user fill his email and password
    And I click submit
    Then I should see the text: agency
    And I should see the text: partners
    And I should see the text: services
    And I should see the text: careers
    And I should see the text: message
    And I click on the avatar button
    And I should see the text: projects
    And I should see the text: teams
    And I should see the text: employees
    And I should see the text: salaries
    And I should see the text: finances
    And I should see the text: board
    And I should see the text: settings
    And I should see the text: log out

  Scenario: Manager user
    Given We have a user. It is manager
    When I visit log in page
    And The last user fill his email and password
    And I click submit
    Then I should see the text: agency
    And I should see the text: partners
    And I should see the text: services
    And I should see the text: careers
    And I should see the text: message
    And I click on the avatar button
    And I should see the text: projects
    And I should see the text: statistic
    And I should see the text: teams
    And I should see the text: tasks
    And I should see the text: board
    And I should see the text: salary
    And I should see the text: settings
    And I should see the text: log out

  Scenario: Employee user
    Given We have a user. It is employee
    When I visit log in page
    And The last user fill his email and password
    And I click submit
    Then I should see the text: agency
    And I should see the text: partners
    And I should see the text: services
    And I should see the text: careers
    And I should see the text: message
    And I click on the avatar button
    And I should see the text: projects
    And I should see the text: employee statistic
    And I should see the text: employee my team
    And I should see the text: employee my tasks
    And I should see the text: board
    And I should see the text: employee salary
    And I should see the text: settings
    And I should see the text: log out

  Scenario: Regular user
    Given We have a user. It is regular
    When I visit log in page
    And The last user fill his email and password
    And I click submit
    Then I should see the text: agency
    And I should see the text: partners
    And I should see the text: services
    And I should see the text: careers
    And I should see the text: message
    And I click on the avatar button
    And I should see the text: regular ask question
    And I should see the text: regular finances
    And I should see the text: projects
    And I should see the text: projects
    And I should see the text: settings
    And I should see the text: log out
