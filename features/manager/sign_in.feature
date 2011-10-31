Feature: Sign in
  In order to access on secret parts of the site
  As a manager
  I should be able to sign in as a manager

  Background:
    Given a manager with the following data:
    | Name     | Pavel Maksimenko    |
    | Email    | manager@example.com |
    | Password | password            |
    And I am not signed in
    
  Scenario: I successfully sign in as a manager
    When I go to the home page
    And I follow "Sign in"
    And I fill in the following:
    | Email    | manager@example.com |
    | Password | password            |
    
    And I press "Sign in"
    Then I should be on the streams page
    And I should be signed in as "Pavel Maksimenko"
    
    
    
    
