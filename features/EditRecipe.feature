Feature: User can edit their recipe

Background: recipe has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation |
  | test     | test | test123  | test123               |
  
  Given the following recipes exist:
  | name | user_id | picture  | description      | ingredients | instructions | 
  | choc | 1       | test.jpg | a summer desert  | sugar       | 1. start     |

  And I am on the ABD home page
  And I am logged in as "test" with password "test123"
  And I am on the recipes page
  When I follow "choc"
  Then I should be on the "choc" recipe page

Scenario: Change Recipe Name 
  And I should see "Edit"
  When I follow "Edit"
  Then I should be on the edit recipe page
  And I fill in "Name" with "mint"
  And I press "Update Recipe"
  Then I should be on the "mint" recipe page

Scenario: Change Recipe picture
  And I should see "Edit"
  When I follow "Edit"
  Then I should be on the edit recipe page
  And I fill in "Picture" with "newimage.jpg"
  And I press "Update"
  Then I should be on the "choc" recipe page

Scenario: Edit description
  And I should see "Edit"
  When I follow "Edit"
  Then I should be on the edit recipe page
  And I fill in "Description" with "Warm snack"
  And I press "Update"
  Then I should be on the "choc" recipe page

Scenario: Edit ingredients
  And I should see "Edit"
  When I follow "Edit"
  Then I should be on the edit recipe page
  And I fill in "Ingredients" with "sugar"
  And I press "Update"
  Then I should be on the "choc" recipe page

Scenario: Edit instruction
  And I should see "Edit"
  When I follow "Edit"
  Then I should be on the edit recipe page
  When I fill in "Instructions" with "1.start"
  And I press "Update"
  Then I should be on the "choc" recipe page
