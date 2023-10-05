Feature: User should be able create a new account

  Scenario: User can register new account with mail and password
    When I visit sign up page
    Then I should see the text: sign up title
    And I fill "example@mail.com" in the email field
    And I fill "password123" in the password field
    And I fill "password123" in the password confirmation field
    And I submit the form
    And I should not see the text: sign up title
    And I should see the text: success registration alert

  Scenario: User will get an error when leave one of the fields empty
    When I visit sign up page
    Then I should see the text: sign up title
    And I fill "example@mail.com" in the email field
    And I submit the form
    And I should not see the text: success registration alert
    And I should see the text: sign up title
