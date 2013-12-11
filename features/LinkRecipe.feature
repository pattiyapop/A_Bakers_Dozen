Feature: User click on a particular recipe link

Background: recipe has been added to the database
  Given the following users exist:
  | username | name | password | password_confirmation |
  | Bob      | test | test123  | test123               |

  Given the following recipes exist:
  | name    | description | user_id | ingredients     | instructions | 
  | cookies | yummy       | 1       | 1 cup of sugars | 1. pouring   |
#  Given I am logged in as "test" with password "test123"
  And I am on the ABD home page

Scenario: User clicks on a recipe link
  Then I should see "All Recipes"
  When I follow "cookies"
  Then I should be on the "cookies" recipe page
