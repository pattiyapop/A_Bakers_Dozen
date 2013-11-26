Feature: Displays list of sorted recipes

Background: recipe has been added to the database

  Given the following recipes exist:
  | name | picture  | description      | overall rating | ingredients | instruction | posted date |
  | test | test.jpg | a summer desert  | 5              | sugar       | 1. statr    | 2013-11-20  |

  And I am on the ABD home page

Scenario: Sort list of recipes in ascending order
  When I follow "Recipe Posted Date"
  Then I should see "2013-11-25" before "2013-11-20"


