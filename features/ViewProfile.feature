Feature: User views their profile

Background: user has been added to the database

  Given the following users exist:
  | username | name | password |
  | test     | Bob  | test123  |
 # | username | name | picture  | interests |
 # | test     | Test | test.jpg | FOOD      |

  And I am on the ABD home page

Scenario: User sees their profile page
  Given I am logged in as "Bob"
  Then I should see "Profile"
  When I follow "Profile"
  Then I should be on the profile page

Scenario: User sees their recipe page
  Given I am logged in as "Bob"
  When I follow "Profile"
  Then I should see "My recipe lists"
