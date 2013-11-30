Feature: User click on a friend link

Background: user has been added to the database

  Given the following user exist:
   | username | name | picture  | interests |
   | TIM C    | Test | test.jpg | FOOD      |

  And I am on the ABD home page

Scenario: User clicks on a friend's link
  Given I am logged in as "test"
  And I am on the profile page
  Then I should see "Lists of Friend"
  When I follow "Tim C"
  Then I should be on the Tim C Profile page
