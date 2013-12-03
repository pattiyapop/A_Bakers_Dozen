# Add a declarative step here for populating the DB with users
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following recipes exist/ do |recipes_table|
  recipes_table.hashes.each do |recipe|
    Recipe.create!(recipe)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end

Given /^I am logged in as "(.*?)" with( the)? password "(.*?)"$/ do |user, the, password|
  steps %Q{
    When I follow "Log-in"
    Then I should be on the Log-in page
    When I fill in "Username" with "#{user}"
    And I fill in "Password" with "#{password}"
    And I press "Sign in"
  }
end

Then /I should see "(.*?)" in the "(.*?)" field$/ do |arg1, arg2|
  find_field("#{arg2}").value.should == arg1
  #pending # express the regexp above with the code you wish you had
end

#Then /I should be on my profile page$/ do
#u = @user.id
#   steps %Q{
#     Then I should be on "/users/#{u}"
#   }
#end

When /^the "(.*?)" profile page$/i do |user|
  user_path(User.find_by_username(user))
end
 
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  index1 = page.body.index(e1)
  index2 = page.body.index(e2)
  assert index1 <= index2
end
