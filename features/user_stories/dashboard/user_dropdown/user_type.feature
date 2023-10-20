Feature: Different user types have different user dropdowns

  Scenario: Admin user
    Given We have a logged in user. It is admin
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
    Given We have a logged in user. It is manager
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
    Given We have a logged in user. It is employee
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
    Given We have a logged in user. It is regular
    Then I should see the text: agency
    And I should see the text: partners
    And I should see the text: services
    And I should see the text: careers
    And I should see the text: message
    And I click on the avatar button
    And I should see the text: ask question
    And I should see the text: calculate
    And I should see the text: settings
    And I should see the text: log out
