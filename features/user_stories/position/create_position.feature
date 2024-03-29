Feature: Admin user can create opened position

  Scenario: Admin can visit page with create position form
    Given We have a logged in user. It is admin
    When I visit positions page
    Then I should see the text: no opened positions
    And I should see the text: create new position
    And I click on the create position button
    And I should see the text: create position title

  Scenario: Admin can create form when all fields are filled correctly
    Given We have a logged in user. It is admin
    And We have 10 technologies
    When I visit new position page
    And I fill "Ruby on Rails developer" in the position title field
    And I fill "We need new RoR developer for our team. We have cookies and milk." in the position body field
    And I fill "5" in the position experience field
    And I check the checkbox with technology number 1
    And I check the checkbox with technology number 2
    And I check the checkbox with technology number 3
    Then I click submit
    And I should see the text: position is created
    And I see text: Ruby on Rails developer

  Scenario: Admin can not create position because title is too short
    Given We have a logged in user. It is admin
    And We have 10 technologies
    When I visit new position page
    And I fill "Ruby" in the position title field
    And I fill "We need new RoR developer for our team. We have cookies and milk." in the position body field
    And I fill "5" in the position experience field
    And I check the checkbox with technology number 1
    And I check the checkbox with technology number 2
    And I check the checkbox with technology number 3
    Then I click submit
    And I should see the text: create position title
    And I should not see the text: position is created

  Scenario: Admin can not create position because body is too short
    Given We have a logged in user. It is admin
    And We have 10 technologies
    When I visit new position page
    And I fill "Ruby on Rails developer" in the position title field
    And I fill "RoR developer" in the position body field
    And I fill "5" in the position experience field
    And I check the checkbox with technology number 1
    And I check the checkbox with technology number 2
    And I check the checkbox with technology number 3
    Then I click submit
    And I should see the text: create position title
    And I should not see the text: position is created

  Scenario: Admin can create position without filling experience field
    Given We have a logged in user. It is admin
    And We have 10 technologies
    When I visit new position page
    And I fill "Ruby on Rails developer" in the position title field
    And I fill "We need new RoR developer for our team. We have cookies and milk." in the position body field
    And I check the checkbox with technology number 1
    And I check the checkbox with technology number 2
    And I check the checkbox with technology number 3
    Then I click submit
    And I should not see the text: create position title
    And I should see the text: position is created
    And I see text: 0+

  Scenario: Admin can create position without checking technology checkboxes
    Given We have a logged in user. It is admin
    And We have 10 technologies
    When I visit new position page
    And I fill "Ruby on Rails developer" in the position title field
    And I fill "We need new RoR developer for our team. We have cookies and milk." in the position body field
    Then I click submit
    And I should not see the text: create position title
    And I should see the text: position is created

