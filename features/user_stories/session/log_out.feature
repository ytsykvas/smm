Feature: User should be able to log out in his account

  Scenario: User can log out of his account
    Given We have a logged in user. It is admin
    And I click on the avatar button
    And I should see the text: log out
    And I click on the sign out button
    And I confirm alert
    And I should see the text: Signed out
