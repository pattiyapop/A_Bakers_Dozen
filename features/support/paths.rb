#!!!!copied from hw3
# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (ABD )?home\s?page$/ then '/recipes'
    when /^the (A Baker's Dozen )?home\s?page$/ then '/recipes'
    when /^the users page$/ then '/users'
    when /^the recipes page$/ then '/recipes'
    when /^the Create New Recipe page$/ then '/recipes/new'
    when /^the sign-up page$/ then '/signup' #'/users/new'
    when /^the Log-in page$/ then '/signin'
    when /^the same Log-in page$/ then '/sessions' #alternate
    when /^my profile page$/ then '/users/1'
    when /^the "(.*?)" profile page$/i then user_path(User.find_by_username($1))
    when /^the "(.*?)" recipe page$/i then recipe_path(Recipe.find_by_name($1))
    when /^the sign-up page again$/ then '/users' #alternate
    when /^the following page$/ then '/users/1/following'
    when /^the edit recipe page$/ then '/recipes/1/edit'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    #when /^the Create New Recipe page$/ then '/recipe/new'

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
