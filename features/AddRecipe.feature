#http://pastebin.com/CSCVp9M3
Feature: User adds a recipe

Background: user has been added to the database

  Given the following users exist:
  | username | name | picture  | interests |
  | test     | Test | test.jpg | FOOD      |

  And I am on the home page

Scenario: User adds a recipe
  Given I am logged in as "test"
  Then I should see "Add new recipe"
  When I follow "Add new recipe"
  Then I should be on the Create New Recipe page
  When I fill in "Name" with "Chocolate Mousse"
  And I fill in "Picture" with "http://i.stack.imgur.com/hxgzB.jpg"
  And I fill in "Description" with "DELICIOUS"
  And I fill in "Ingredients" with "DELICIOUS"
  And I fill in "Instructions" with "EAT"
  And I press "Save Changes"
  Then I should be on the ABD home pagee
  And I should see "Chocolate Mousse"

Scenario: Viewer can't see "Add new recipe"
  Then I should not see "Add new recipe"
