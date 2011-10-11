Feature: List of streams
  In order to to view a list of features
  As a user
  Should be able go to the page with streams
  
  Background: Sign out
    Given I am not signed in
    
  Scenario: User go to the page with streams
    When I go to the home page
    Then I should be on the streams page
  
  

  
