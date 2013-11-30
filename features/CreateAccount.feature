Feature: Viewer can sign up / create an account

Background: viewer is on the homepage
  Given the following users exist:
  | username | 
  | test2    |
  #| password |   
  #| test123  | 

  Given I am on the ABD home page
  When I follow "Sign Up"
  Then I should be on the sign up page

Scenario: Sign up successfuly
  When I fill in "Username" with "test"
  And I fill in "Password" with "test123"
  And I fill in "Image" with "test.jpg"
  And I fill in "Interests" with "DONUTS"
  And I press "Sign Up"
  Then I should be on the ABD home page
  And I should see "Your account has been created"
  And I should see "test"

Scenario: Sign up with existing username
  When I fill in "Username" with "test2"
  And I fill in "Password" with "test123"
  And I fill in "Image" with "test.jpg"
  And I fill in "Interests" with "DONUTS"
  And I press "Sign Up"
  Then I should be on the sign-up page
  And I should see "That username is already in use"

Scenario: Sign up with no other information
  When I fill in "Username" with "test"
  And I press "Sign Up"
  Then I should be on the sign-up page
  And I should see "Please fill in all fields"
  And I should see "test" in the "Username" field
  #session saves some information
