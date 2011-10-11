Feature: Update stream
  In order to manage a streams
  A manager
  Should be able to create and update a stream
  
  Background:
    Given a stream with the following data:
    | Title | New stream                  |
    | Url   | http://example.com/feed.xml |
    And I am signed in with the following data:
    | Email    | manager@example.com |
    | Password | password            |
  
  Scenario: Successfully update
    When I go to the streams page
    And I follow "Edit New stream"
    Then I should be on the stream's edit page with title "New stream"
    
    When I fill in "Title" with "Really new stream"
    And I press "Save"
    
    Then I should be on the streams page
    And I should see "Really new stream"