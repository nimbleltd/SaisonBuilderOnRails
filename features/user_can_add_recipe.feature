Feature: User can add a recipe
  In order to expand available recipes
  As a user
  I want to add a new recipe

  Scenario: Happy Home Path
    Given the user "clyde@brewit.org" with password "mypassword"
    Given the ingredient "Pilsner", type code "1"
    When I go to the homepage
    And I click "Log In"
    And I fill in "clyde@brewit.org" for "Email"
    And I fill in "mypassword" for "Password"
    And I press "Sign in"
    And I press "Build Saison"
    And I fill in "Brown Saison" for "Name"
    And I fill in "Pretty tasty!" for "Description"
    And I fill in "5 gallons" for "Batch size"
    And I fill in "75 mins" for "Mash"
    And I fill in "149F" for "@"
    And I fill in "90 mins" for "Boil length"
    And I choose "Pilsner" for "Ingredient"
    And I fill in "8" for "Quantity"
    And I press "Add Recipe"
    Then I should see "Brown Saison"
    And I should see "Pretty tasty!"

  Scenario: Happy Build Path
    Given the user "clyde@brewit.org" with password "mypassword"
    Given the ingredient "Pilsner", type code "1"
    When I go to the homepage
    And I click "Log In"
    And I fill in "clyde@brewit.org" for "Email"
    And I fill in "mypassword" for "Password"
    And I press "Sign in"
    And I click "Recipes"
    And I press "Add Recipe"
    And I fill in "Brown Saison" for "Name"
    And I fill in "Pretty tasty!" for "Description"
    And I fill in "5 gallons" for "Batch size"
    And I fill in "75 mins" for "Mash"
    And I fill in "149F" for "@"
    And I fill in "90 mins" for "Boil length"
    And I choose "Pilsner" for "Ingredient"
    And I fill in "8" for "Quantity"
    And I press "Add Recipe"
    Then I should see "Brown Saison"
    And I should see "Pretty tasty!"

  Scenario: Happy Hoppy Build Path
    Given the user "clyde@brewit.org" with password "mypassword"
    Given the ingredient "Saaz", type code "2"
    Given a recipe ingredient with usage "Boil"
    When I go to the homepage
    And I click "Log In"
    And I fill in "clyde@brewit.org" for "Email"
    And I fill in "mypassword" for "Password"
    And I press "Sign in"
    And I click "Recipes"
    And I press "Add Recipe"
    And I fill in "New Saison" for "Name"
    And I fill in "Smells like teen spirit!" for "Description"
    And I fill in "5 gallons" for "Batch size"
    And I fill in "75 mins" for "Mash"
    And I fill in "149F" for "@"
    And I fill in "90 mins" for "Boil length"
    And I choose "Saaz" for "Ingredient"
    And I fill in "1" for "Quantity"
    And I choose "Boil" for "Usage"
    And I fill in "60 mins" for "Duration"
    And I press "Add Recipe"
    And I click "New Saison"
    Then I should see "New Saison"
    And I should see "1.0 oz Saaz"
    And I should see "Add during: Boil, @ 60 mins"

  Scenario: Happy Yeasty Build Path
    Given the user "clyde@brewit.org" with password "mypassword"
    Given the yeast "Dupont Strain", with WL code "565" and Wyeast code "3724"
    Given a recipe ingredient with usage "Primary"
    When I go to the homepage
    And I click "Log In"
    And I fill in "clyde@brewit.org" for "Email"
    And I fill in "mypassword" for "Password"
    And I press "Sign in"
    And I click "Recipes"
    And I press "Add Recipe"
    And I fill in "New Saison" for "Name"
    And I fill in "Smells like teen spirit!" for "Description"
    And I fill in "5 gallons" for "Batch size"
    And I fill in "75 mins" for "Mash"
    And I fill in "149F" for "@"
    And I fill in "90 mins" for "Boil length"
    And I choose "Dupont Strain" for "Ingredient"
    And I fill in "1" for "Quantity"
    And I choose "Primary" for "Usage"
    And I press "Add Recipe"
    And I click "New Saison"
    Then I should see "New Saison"
    And I should see "1.0 pkg Dupont Strain"
    And I should see "Add during: Primary. White Labs: WLP565, Wyeast: 3724"

  Scenario: Duplicate Name
    Given the user "clyde@brewit.org" with password "mypassword"
    Given the ingredient "Pilsner", type code "1"
    Given the recipe "Brown Saison" using "8" lbs of "Pilsner"
    When I go to the homepage
    And I click "Log In"
    And I fill in "clyde@brewit.org" for "Email"
    And I fill in "mypassword" for "Password"
    And I press "Sign in"
    And I press "Build Saison"
    And I fill in "Brown Saison" for "Name"
    And I fill in "This has a duplicate name!" for "Description"
    And I fill in "5 gallons" for "Batch size"
    And I fill in "75 mins" for "Mash"
    And I fill in "149F" for "@"
    And I fill in "90 mins" for "Boil length"
    And I choose "Pilsner" for "Ingredient"
    And I fill in "1" for "Quantity"
    And I press "Add Recipe"
    Then I should not see "This has a duplicate name!"

  Scenario: No Name Provided
    Given the user "clyde@brewit.org" with password "mypassword"
    Given the ingredient "Pilsner", type code "1"
    When I go to the homepage
    And I click "Log In"
    And I fill in "clyde@brewit.org" for "Email"
    And I fill in "mypassword" for "Password"
    And I press "Sign in"
    And I press "Build Saison"
    And I fill in "Pretty tasty!" for "Description"
    And I fill in "5 gallons" for "Batch size"
    And I fill in "75 mins" for "Mash"
    And I fill in "149F" for "@"
    And I fill in "90 mins" for "Boil length"
    And I choose "Pilsner" for "Ingredient"
    And I fill in "8" for "Quantity"
    And I press "Add Recipe"
    Then I should not see "Brown Saison"
    And I should not see "Pretty tasty!"