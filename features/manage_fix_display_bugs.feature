Feature: Manage fix_display_bugs
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: I've bought a trip
    Given a set of trips
    And a logged in user
    When the user buys a trip
    And goes back to the home page
    Then the user should not see the trip
