namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #make_users
    #make_comments
    #make_recipes
    make_relationships
    users = User.all(limit: 6)
    recipes = Recipe.all(limit: 3)
    users.each do |user|
       recipes.each do |recipe|
           content = "#{recipe.name} is great!" #Faker::Lorem.sentence(3)
           rating = rand(3)+1
           recipe.comments.create!(content: content, user_id: user.id, rating: rating)
       end
    end
  end
end

def make_users
   #user= User.create!(name: "Tom",
   #                    password: "foo123",
   #                    password_confirmation: "foo123")
  n = 0
  while (n < 10) do
    #name = Faker::Name.name
    username = "username#{n}"
    name = "name"+n.to_s
    #debugger
    password = "password"
    password_confirmation = "password"
    picture = "picture"
    interests = "interests"
    User.create!(username: username,
  		 name: name,
		 password: password,
                 password_confirmation: password,
		 picture: picture,
		 interests: interests)
    n = n+1
    end
end 

def make_comments
  recipes = Recipe.all(limit: 6)
  recipes.each do |recipe|
    content = "#{recipe.name} is wonderful!"
    user_id = "1"
    rating = "4"
    #content = Faker::Lorem.sentence(5)
    recipe.comments.create!(content: content, user_id: user_id, rating: rating)
  end
end

def make_recipes
  users = User.all(limit: 10)
  users.each do |user|
    name = "name#{user}"
    picture = "picture"
    description = "description"
    ingredients = "ingredients"
    instructions = "instructions"
    user_id = user.id
    user.recipes.create!(name: name, picture: picture, description: description, ingredients: ingredients, instructions: instructions, 	user_id: user_id)
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
