Feature: User can log-out

Background: user has been added to the database

  Given the following users exist:
  | username                | password |
  | test                    | test123  | 

  And I am on the ABD home page
  And I am logged in

Scenario: Log-out
  When I follow "Log-out"
  Then I should be on the home page
  And I should see "You have been logged out."
