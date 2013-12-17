# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#RUN: bundle exec rake db:seed

users = [{:username => 'MBrugh', :name => 'Michael Brughelli', :password => 'mibr', :chef => true}, {:username => 'SFlynn', :name => 'Sierra Flynn', :password => 'SFly', :chef => true}, {:username => 'PMahap', :name => 'Pattiya Mahapasuthanon', :password => 'PMah', :chef => true}, {:username => 'ASchwa', :name => 'Arnold Schwarzenegger', :password => 'ASch'}, {:username => 'SStall', :name => 'Silvester Stallone', :password => 'SSta'}, {:username => 'BWilli', :name => 'Bruce Willis', :password => 'BWil'}, {:username => 'JHetfi', :name => 'James Hetfield', :password => 'JHet'}, {:username => 'LUlric' , :name => 'Lars Ulrich', :password => 'LUlr'}, {:username => 'KHamme', :name => 'Kirk Hammet', :password => 'KHam'},{:username => 'CBurto', :name => 'Cliff Burton', :password => 'CBur'}]

users.each do |user|
  User.create!(user)
end

######################################################################

applepie = {
:name => 'Apple Pie', 
:picture => 'https://www.peacethroughpie.org/wp-content/uploads/2013/09/baked-pie.jpg', 
:description => 'Apple Pie Spice is the flavor secret for this classic double-crusted pie. Serve with a scoop of vanilla ice cream, if desired. ', 
:ingredients => '

    1 package (15 ounces) refrigerated pie crusts
    1 cup sugar
    1/4 cup flour
    1 1/2 teaspoons McCormick Apple Pie Spice
    8 cups thinly sliced peeled Granny Smith apples
    1 tablespoon butter

', 
:instructions => '
1. Preheat oven to 400F. Prepare pie crusts as directed on package for two-crust pie using 9-inch pie plate.

2. Mix sugar, flour and apple pie spice in small bowl. Sprinkle over apples in large bowl; toss to coat well. Spoon into pastry-lined pie plate. Dot with butter. Top with second pie crust. Seal and flute edge. Cut small slits in top crust. Brush crust with beaten egg and sprinkle with additional sugar, if desired.

3. Bake 45 to 50 minutes or until crust is golden brown and filling is bubbly. Cool on wire rack.', 
:user_id => 1}

chocmousse = {
:name => 'Easy Chocolate Mousse', 
:picture => 'http://www.twopeasandtheirpod.com/wp-content/uploads/2013/03/Easy-Chocolate-Mousse-1.jpg', 
:description => 'The chocolate mousse is rich, silky, and smooth. I topped it off with whipped cream and chocolate shavings. It is pretty to serve and a treat to eat!', 
:ingredients => '
7 oz bittersweet or semisweet chocolate, finely chopped
3 tablespoons water
4 large eggs, at room temperature, separated
Pinch of coarse salt
', 
:instructions => '
1. Combine the chocolate and water in a heatproof bowl set over a pan of barely simmering water. Heat until the chocolate is almost completely melted, stirring occasionally. Remove the bowl from the heat and stir until the mixture is smooth. Set aside and let cool to near room temperature.

2. In a clean, dry bowl of a stand mixer fitted with the whisk attachment, combine the egg whites and the salt. Whip on medium-high speed until stiff peaks form. They should be thick and smooth.

3. Stir the egg yolks into the cooled chocolate mixture. Add one third of the whipped egg whites to the bowl with the chocolate and fold gently to lighten up the mixture. Fold in the remaining egg whites gently with a spatula just until no visible streaks are left.

4. Portion the mixture into 4 individual serving dishes (or 2 larger serving dishes, for a romantic, share-friendly dessert). Cover with plastic wrap and refrigerate at least 3 hours. Serve with freshly whipped cream, if desired.
', 
:user_id => 3}

stirfry={
:name => 'Tofu-Vegetable Stir-Fry', 
:picture => 'http://img.foodnetwork.com/FOOD/2011/11/14/FNM_120111-WN-Dinners-046_s4x3_lg.jpg', 
:description => 'The perfectly simple vegetarian stir-fry loaded with snow peas, tofu and mushrooms with hints of chile, garlic, and ginger', 
:ingredients => '
1 cup white or jasmine rice
3 tablespoons low-sodium soy sauce
3 tablespoons hoisin sauce
2 tablespoons balsamic vinegar
1 tablespoon Asian chile sauce (such as Sriracha)
2 teaspoons cornstarch
2 tablespoons sesame oil
4 scallions, sliced (white and green parts separated)
2 cloves garlic, minced
1 1-inch piece ginger, peeled and finely chopped
4 ounces shiitake mushrooms, stemmed and chopped
4 ounces snow peas
1 14-ounce package soft tofu, drained and cut into 1-inch cubes
', 
:instructions => '
Cook the rice as the label directs. Meanwhile, whisk the soy sauce, hoisin sauce, vinegar, chile sauce, cornstarch and 1 cup water in a small bowl until smooth; set aside.

Heat the sesame oil in a wok or large skillet over medium-high heat. Add the scallion whites, garlic and ginger and stir-fry 30 seconds. Add the mushrooms and stir-fry until golden brown and tender, about 3 minutes. Add the snow peas and stir-fry 30 more seconds.

Whisk the reserved soy sauce mixture and add it to the wok. Bring to a simmer, then add the tofu. Cook, stirring occasionally, until the sauce is thick, about 2 minutes. Sprinkle with the scallion greens.

Fluff the rice with a fork and divide among bowls. Top with the stir-fry and sauce.

Read more at: http://www.foodnetwork.com/recipes/food-network-kitchens/tofu-vegetable-stir-fry-recipe/index.html?oc=linkback
', 
:user_id => 2
}

recipes = [applepie, chocmousse, stirfry]

recipes.each do |recipe|
  Recipe.create!(recipe)
end
