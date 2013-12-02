Feature: Displays list of sorted recipes

Background: recipe has been added to the database

  Given the following recipes exist:
  | name    | description | user_id | ingredients     | instructions | 
  | cookies | yummy       | 1       | 1 cup of sugars | 1. pouring   |
  #Recipe Posted Date |

  And I am on the ABD home page

Scenario: Sort list of recipes in ascending order
  When I follow "Recipe Posted Date"
  Then I should see "2013-11-25" before "2013-11-20"


