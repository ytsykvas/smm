Feature: User should be able create a new account

  Scenario: User can register new account with mail and password
    When I visit sign up page
    Then I should see the text: sign up title
    And I fill "example@mail.com" in the email field
    And I fill "password123" in the password field
    And I fill "password123" in the password field
    And I click submit
    And I should see the text: sign up title

#  Scenario: User can be redirected to sign in page by the link
#    When I visit sign up page

#  Scenario: User get an error when password and password confirmation fields are different
#    When I visit sign up page
