Feature: User posts new recipe link from home page or profile page

Background: user has been added to the database

  Given the following users exist:
  | username | name | picture  | interests |
  | test     | Test | test.jpg | FOOD      |

  And I am on the ABD home page

Scenario: User clicks post new recipe link
  Given I am logged in as "test"
  Then I should see "Post New Recipe"
  When I follow "Post New Recipe"
  Then I should be on the Create New Recipe page


