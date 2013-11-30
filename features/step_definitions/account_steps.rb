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

Given /^I am logged in as "(.*?)"$/ do |user|
  pending # express the regexp above with the code you wish you had
  #page should have my name on it, or session should hold my username
end

Then /I should see "(.*?)" in the "(.*?)" field$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  index1 = page.body.index(e1)
  index2 = page.body.index(e2)
  assert index1 <= index2
end

