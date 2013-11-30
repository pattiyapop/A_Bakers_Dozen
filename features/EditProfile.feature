Feature: User can edit their profile

Background: user has been added to the database

  Given the following users exist:
  | username | name | 
  | test     | Bob  | 
  #|pic | interests |
  #| N/A | none      |
  #|password | test 123|

  And I am on the ABD home page
  And I am logged in
  When I follow "test"
  Then I should be on the users page

Scenario: Change password successfuly
  When I fill in "Current password" with "test123"
  And I fill in "New Password" with "newpw"
  #And I fill in "Confirm New Password" with "newpw"
  And I press "Update Information"
  Then I should be on my profile page
  And I should see "Your password has been updated."

Scenario: Change profile picture
  When I fill in "Profile Picture" with "newimage.jpg"
  And I press "Update Information"
  Then I should be on my profile page
  And I should see "newimage.jpg"

Scenario: Change interests
  When I fill in "Interests" with "FOOD"
  And I press "Update Information"
  Then I should be on my profile page
  And I should see "FOOD"
