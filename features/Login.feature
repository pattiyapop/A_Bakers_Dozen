Feature: Viewer can log-in

Background: user has been added to the database

  Given the following movies exist:
  | username                | password |
  | test                    | test123  | 

  And I am on the ABD home page
  When I follow "Log-in"
  Then I should be on the log-in page

Scenario: Log-in successfuly
  When I fill in "Username" with "test"
  And I fill in "Password" with "test123"
  And I press "Log-in"
  Then I should be on the ABD home page
  And I should see "Welcome, test!"

Scenario: Log-in unsuccessfuly
  When I fill in "Username" with "testBAD"
  And I fill in "Password" with "test123"
  And I press "Log-in"
  Then I should be on the log-in page
  And I should see "Invalid username/password"
