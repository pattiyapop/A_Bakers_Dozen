#http://pastebin.com/CSCVp9M3
Feature: User can manually add movie

Scenario: Add a movie
  Given I am on the ABD home page
  When I follow "Add new recipe"
  Then I should be on the Create New Recipe page
  When I fill in "Name" with "Chocolate Mousse"
  And I fill in "Picture" with "http://i.stack.imgur.com/hxgzB.jpg"
  And I fill in "Description" with "DELICIOUS"
  And I press "Save Changes"
  Then I should be on the ABD home pagee
  And I should see "Chocolate Mousse"
