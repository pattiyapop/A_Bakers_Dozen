Feature: User adds and deletes friends

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation | 
  | test     | Test | test123  | test123    	       |
  | Tom      | Test | test124  | test124    	       |  

  And I am on my profile page

Scenario: User follows another users
  Given I am logged in as "test" with password "test123"
  Then I should see "Follow"
  When I follow "Follow"
  Then I am on the users page

