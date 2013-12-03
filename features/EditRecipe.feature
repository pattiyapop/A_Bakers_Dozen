Feature: User can edit their recipe

Background: recipe has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation |
  | Bob      | test | test123  | test123               |
  
  Given the following recipes exist:
   #| name    | description | user_id | overall rating | posted date |
   #| cookies | yummy       | 1       | 5              | 2013-11-20  |
   
  | name | user_id | picture  | description      | ingredients | instructions | 
  | choc | 1       | test.jpg | a summer desert  | sugar       | 1. start     |

  And I am on the ABD home page
  And I am logged in as "test" with password "test123"
  And I am on the recipes page
  When I follow "choc"
  Then I should be on the edit recipe page

Scenario: Change Recipe Name 
  When I fill in "Old Recipe" with "choc"
  And I fill in "New Recipe" with "mint"
  And I press "Update Information"
  Then I should be on my recipe page
  And I should see "Your recipe name has been updated."

Scenario: Change Recipe picture
  When I fill in "Recipe Picture" with "newimage.jpg"
  And I press "Update Information"
  Then I should be on my recipe page
  And I should see "newimage.jpg"

Scenario: Edit description
  When I fill in "Descriptions" with "Warm snack"
  And I press "Update Information"
  Then I should be on my recipe page
  And I should see "Warm snack"

Scenario: Change overall rating
  When I fill in "Rating" with "4"
  And I press "Update Information"
  Then I should be on my recipe page
  And I should see "Four Stars rating"

Scenario: Edit ingredients
 When I fill in "Ingredient Lists" with "sugar"
  And I press "Update Information"
  Then I should be on my recipe page
  And I should see "sugar"

Scenario: Edit instruction
 When I fill in "Instruction" with "1.start"
  And I press "Update Information"
  Then I should be on my recipe page
  And I should see "1.start"
