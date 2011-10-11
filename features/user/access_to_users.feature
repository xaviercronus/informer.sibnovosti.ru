Feature: Access to users
  In section manage users
  As a user
  Should be denied
  
  Scenario: User tries to access to the closed section of the site
    Given I am not signed in
    When I go to the users page
    Then I should be on the sign in page
    And I should see "You are not authorized to access this page."