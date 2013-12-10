Feature: User can edit their profile

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation |
  | test     | Bob  | test123  | test123	       |
  #|pic | interests |
  #| N/A | none      |
  #|password | test 123|

  And I am on the ABD home page
  And I am logged in as "test" with password "test123"
  When I follow "Profile"
  Then I should be on the "test" profile page
  When I follow "Edit my information"

Scenario: Change password successfuly
  When I fill in "Password" with "newpw"
  And I fill in "Confirmation" with "newpw"
  And I press "Update Information"
  Then I should be on the "test" profile page
  And I should see "Your password has been updated."

Scenario: Change profile picture
  When I fill in "Picture" with "newimage.jpg"
  And I press "Update Information"
  Then I should be on the "test" profile page
  And I should see "newimage.jpg"

Scenario: Change interests
  When I fill in "Interests" with "FOOD"
  And I press "Update Information"
  Then I should be on the "test" profile page
  And I should see "FOOD"
