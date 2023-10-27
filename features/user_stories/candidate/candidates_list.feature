Feature: Admin user can see all candidates that replied to position

  Scenario: User can see all candidates replied to opened position
    Given We have 2 opened positions
    And For position number 1 we have 5 candidates
    When