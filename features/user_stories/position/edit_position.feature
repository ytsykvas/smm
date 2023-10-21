Feature: Admin user can edit a position

  Scenario: Admin can edit position and all fields are valid
    Given We have a logged in user. It is admin
    And We have 1 opened positions
    When I visit positions page
    And I click on the show position button
    And I click on the edit position button
    Then I should see the text: edit position title
    When I fill "5" in the position experience field
    And I click submit
    Then I should see the text: updated position notice

  Scenario: Admin can not edit position when form filled wrong
    Given We have a logged in user. It is admin
    And We have 1 opened positions
    When I visit positions page
    And I click on the show position button
    And I click on the edit position button
    And I should see the text: edit position title
    And I fill "Ruby" in the position title field
    And I click submit
    Then I should not see the text: updated position notice
    And I should see the text: edit position title
