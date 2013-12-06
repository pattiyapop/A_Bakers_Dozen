Feature: Displays list of sorted recipes

Background: recipe has been added to the database

  Given the following recipes exist:
  | name     | description | user_id | created_at |
  | cookies  | yummy   | 1  | "2013-11-28 03:17:03 UTC" |
  | cake     | yummy   | 1  | "2013-11-29 03:17:03 UTC" |
  | pasta    | yummy   | 1  | "2013-11-22 03:17:03 UTC" |
  | stir-fry | yummy   | 1  | "2013-11-24 03:17:03 UTC" |
  | pizza    | yummy   | 1  | "2013-11-24 03:20:03 UTC" |
  #Recipe Posted Date |

  And I am on the ABD home page

Scenario: List of recipes is sorted
  Then I should see "cake" before "cookies"
  And I should see "cookies" before "pizza"
  And I should see "pizza" before "stir-fry"
  And I should see "stir-fry" before "pasta"

