Feature: Viewer can log-in

Background: user has been added to the database

  Given the following users exist:
  | username | name | password | password_confirmation |
  | test0    | Bob  | test123  | test123               |

  And I am on the ABD home page
  When I follow "Log-in"
  Then I should be on the Log-in page

Scenario: Log-in successfuly
  When I fill in "Username" with "test0"
  And I fill in "Password" with "test123"
  And I press "Sign in"
  Then I should be on my profile page
  And I should see "Welcome, Bob!"

Scenario: Log-in with bad username
  When I fill in "Username" with "testABD"
  And I fill in "Password" with "test123"
  And I press "Sign in"
  Then I should be on the same Log-in page
  And I should see "Invalid username/password"

Scenario: Log-in with bad password
  When I fill in "Username" with "test"
  And I fill in "Password" with "testBAD"
  And I press "Sign in"
  Then I should be on the same Log-in page
  And I should see "Invalid username/password"
