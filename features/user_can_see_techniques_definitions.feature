Feature: User can see technique definitions
  In order to learn about Saisons
  As a user
  I want to view brewing technique definitions

  Scenario: Successful Navigation
    When I go to the homepage
    And I click "learn"
    And I press "Techniques"
    Then I should see "Brewing Techniques"
    And I should see "Dryhopping"