namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
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
