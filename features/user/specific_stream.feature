Feature: Specific stream
  In order to view a specific stream
  As a user
  Should be able go to the page specific stream
  
  Background: 
    Given a stream with the following data:
    | Title | Test stream                 |
    | Url   | http://example.com/feed.xml |
    And I am not signed in
    
  Scenario: User go to the specific stream
    When I go to the home page
    Then I should be on the streams page
    
    When I follow "Test stream"
    Then I should be on the stream's page with title "Test stream"
