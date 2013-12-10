Feature: User adds a comment and a review

Background: user has been added to the database
  Given the following users exist:
  | username | name | password | password_confirmation |
  | test2    | Bob  | test123  | test123               |
  | test     | Sam  | test123  | test123               |
  | Michelin Chef | Mr. Cool | uber | uber |

    Given the following recipes exist: 
      | name    | description | user_id | ingredients   | instructions |
      | cookies | yummy    | 1      | 1 cup of sugars | 1. pouring   |

  Given the following comments exist:
  | content     | recipe_id | user_id | rating | 
  | "delicious" | 1         | 1       | 4      |
  | "good"      | 1         | 2       | 3      |
  | "eh"        | 1         | 3       | 2      |

  And I am on the ABD homepage

Scenario: User adds a comment and rating
  Given I am logged in as "test" with the password "test123"
  And I am on the recipes page
  Then I should see "cookies"
  When I follow "cookies"
  Then I should see "Add new comment"
  When I follow "Add new comment"
  Then I should see "Content"
  When I fill in "Content" with "Very good menu!"
  And I should see "Rating"
  When I choose "All right"
  And I press "Save"
  Then I should see "Comment was successfully created."
  And I should see "Very good menu!"

Scenario: Viewer sees comments but can't post
  Given I am on the recipes page
  When I follow "cookies"
  Then I should see "Please sign-in to comment."
  And I should see "delicious"
  But I should not see "Add new comment"

#Scenario: Chef adds a chef rating
#  Given I am logged in as "Michelin Chef" with the password "uber"
#  And I am on the recipes page
#  When I follow "cookies"
#  When I follow "Add new comment"
#  Then I should see "Chef Rating with five stars"
#  When I fill in "Special Rating" with "4"
#  Then I should see "Four stars rating"

#Scenario: Viewer sees overall average rating 
#  Given I am on the recipes page
#  When I follow "cookies"
#  Then I should see "Overall Rating: 3/4"
