Feature: User can edit their recipe

Background: recipe has been added to the database

  Given the following recipes exist:
   | name | picture  | description      | overall rating | ingredients | instruction | posted date |
   | choc | test.jpg | a summer desert  | 5              | sugar       | 1. start    | 2013-11-20  |

  And I am on the specific recipe page
  And I am logged in
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
