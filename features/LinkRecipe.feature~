Feature: User click on a particular recipe link

Background: recipe has been added to the database

  Given the following recipes exist:
   | name | picture  | description      | overall rating | ingredients | instruction | posted date |
   | test | test.jpg | a summer desert  | 5              | sugar       | 1. statr    | 2013-11-20  |

  And I am on the ABD home page

Scenario: User clicks on a recipe link
  Given I am logged in as "test"
  Then I should see "Recipe Lists"
  When I follow "Recipe Link"
  Then I should be on the specific Recipe page
