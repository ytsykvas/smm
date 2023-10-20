Feature: Different user types have different functions allowed on position page

  Scenario: User is not authorised and there is no opened positions
    When I visit positions page
    Then I should see the text: no opened positions

  Scenario: User is not authorised and there are some opened positions with pagination
    Given We have 15 opened positions
    When I visit positions page
    Then I should see position number 1
    And I should see position number 10
    And I should not see position number 11
    And I should not see position number 15
    And I should see pagination

  Scenario: User authorised as regular and there are some opened positions without pagination
    Given We have a logged in user. It is regular
    And We have 10 opened positions
    When I visit positions page
    Then I should see position number 1
    And I should see position number 10
    And I should not see position number 11
    And I should not see pagination

  Scenario: User is admin and there is no opened positions
    Given We have a logged in user. It is admin
    When I visit positions page
    Then I should see the text: no opened positions
    And I should see the text: create new position

  Scenario: User is admin and there are some opened positions with pagination
    Given We have a logged in user. It is admin
    And We have 15 opened positions
    When I visit positions page
    Then I should not see the text: no opened positions
    And I should see the text: create new position
    And I should see position number 1
    And I should see position number 10
    And I should not see position number 11
    And I should not see position number 15
    And I should see pagination
    And I should not see the text: no opened positions
    And I should see the text: create new position

  Scenario: User is manager and there are some opened positions with pagination
    Given We have a logged in user. It is manager
    And We have 15 opened positions
    When I visit positions page
    And I should see position number 1
    And I should see position number 10
    And I should not see position number 11
    And I should not see position number 15
    And I should see pagination
    Then I should not see the text: no opened positions
    And I should not see the text: create new position

  Scenario: User is employee and there are some opened positions with pagination
    Given We have a logged in user. It is employee
    And We have 15 opened positions
    When I visit positions page
    And I should see position number 1
    And I should see position number 10
    And I should not see position number 11
    And I should not see position number 15
    And I should see pagination
    Then I should not see the text: no opened positions
    And I should not see the text: create new position
