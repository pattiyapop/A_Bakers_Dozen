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

Given(/^I am logged in as "(.*?)"$/) do |user|
  pending # express the regexp above with the code you wish you had
  #page should have my name on it, or session should hold my username
end






