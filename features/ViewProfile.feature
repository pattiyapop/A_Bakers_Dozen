Feature: User views their profile

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation |
  | test     | Bob  | test123  | test123               |

  Given the following recipes exist:
  | name    | description | user_id | ingredients     | instructions | 
  | cookies | yummy       | 1       | 1 cup of sugars | 1. pouring   |

  And I am on the ABD home page

Scenario: User sees their profile page
  Given I am logged in as "test" with password "test123"
  Then I should see "Profile"
  When I follow "Profile"
  Then I should be on the "test" profile page

Scenario: User sees their recipe page
  Given I am logged in as "test" with password "test123"
  When I follow "Profile"
  Then I should see "test's Recipes"
