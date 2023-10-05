Feature: User should be able to log in in his account

  Scenario: User can log in to his account
    Given We have a user. It is admin
    When I visit log in page
    And The last user fill his email and password
    And I click submit
    Then I should see the text: signed in alert

  Scenario: User will get an error when enter wrong data
    Given We have a user. It is admin
    When I visit log in page
    And I fill "example@mail.com" in the email field
    And I fill "password123" in the password field
    And I click submit
    Then I should not see the text: signed in alert
    And I should see the text: forgot password
