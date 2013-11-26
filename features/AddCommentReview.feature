Feature: User adds a comment and a review

Background: user has been added to the database

  Given the following comments exist:
  | owner | comment | date       | rating |
  | test  | good!   | 2013-11-20 | 5      |

  And I am on the specific recipe home page

Scenario: User adds a comment
  Given I am logged in as "test"
  Then I should see "Add new comment"
  When I follow "Add new comment"
  Then I should see on "Comment"
  When I fill in "Comment" with "Very good menu!"
  And I press "Save"
  Then I should see "Very good menu!"

Scenario: User adds a rating
  Given I am logged in as "test"
  Then I should see "Rating with five stars"
  When I fill in "Rating" with "5"
  Then I should see "Five stars rating"

Scenario: Chef adds a chef rating
  Given I am logged in as "Michelin Chef"
  Then I should see "Chef Rating with five stars"
  When I fill in "Special Rating" with "4"
  Then I should see "Four stars rating"

Scenario: Viewer sees overall rating 
  Given I am on the ABD home page
  Then I should see "Overall Rating"
