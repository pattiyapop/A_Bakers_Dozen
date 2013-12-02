Feature: User adds and deletes friends

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation | 
  | test     | Test | test123  | test123    	       |

  And I am on the users page

Scenario: User adds friends
  Given I am logged in as "test"
  Then I should see "Add friend"
  When I follow "Add friend"
  Then I should see "Friend is added"

Scenario: User deletes friends
  Given I am logged in as "test"
  Then I should see "Delete friend"
  When I follow "Delete friend"
  Then I should see "Friend is deleted"
  And I should not see "Friend"
