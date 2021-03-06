Feature: User posts new recipe link from home page or profile page

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation | picture  | interests |
  | test     | Test | test123  | test123	       |test.jpg | FOOD      |

  Given the following recipes exist:
  | name    | description | user_id | ingredients     | instructions | 
  | cookies | yummy       | 1       | 1 cup of sugars | 1. pouring   |

  And I am on the ABD home page
  Given I am logged in as "test" with the password "test123"
  And I am on the recipes page

Scenario: User clicks post new recipe link
  Then I should see "Post New Recipe"
  When I follow "Post New Recipe"
  Then I should be on the Create New Recipe page


