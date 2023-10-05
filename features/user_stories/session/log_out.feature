Feature: User should be able to log out in his account

  Scenario: User can log out of his account
    Given We have a user. It is admin
    When I visit log in page
    And The last user fill his email and password
    And I click submit
    And I click on the avatar button
    And I should see the text: log out
    And I click on the sign out button
    And I confirm alert
    And I should see the text: Signed out
