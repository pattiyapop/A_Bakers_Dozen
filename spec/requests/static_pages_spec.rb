#we don't have / need static pages in our app???

describe "Static pages" do

    describe "Home page" do

      it "should have the h1 'A Baker's Dozen'" do
        visit recipes_path
        expect(page).to have_content('A social recipe-sharing site')
      end

      it "should have the base title" do
        visit recipes_path
        expect(page).to have_title("A Baker's Dozen")
      end
  
      it "should not have the custom page title" do
        visit recipes_path
        expect(page).not_to have_title('| Home')
      end
    end

    describe "All Comments page" do
    
      it "should have h1 'A Baker's Dozen'" do
        visit comments_path
        expect(page).to have_content('Recipe 	User 	Content 	Rating')
      end

      it "should have the base title" do
        visit comments_path
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "My Recipes page" do
    
      it "should have h1 'A Baker's Dozen'" do
        visit recipes_path
        expect(page).to have_content('Post New Recipe')
      end

      it "should have the base title" do
        visit recipes_path
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "My Friends page" do
    
      it "should have h1 'A Baker's Dozen'" do
        visit users_path
        expect(page).to have_content('Username 	Name 	Picture 	Interests')
      end

      it "should have the base title" do
        visit users_path
        expect(page).to have_title("A Baker's Dozen")
      end

     describe "Log-in page" do
    
      it "should have h1 'A Baker's Dozen'" do
        visit signin_path
        expect(page).to have_content('New user? Sign up now!')
      end

      it "should have the base title" do
        visit signin_path
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "Log-out page" do
    
      it "should have h1 'A Baker's Dozen'" do
        visit signout_path
        expect(page).to have_content('You have been logged out.')
      end

      it "should have the base title" do
        visit signout_path
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "Profile page" do
    
      it "should have h1 'A Baker's Dozen'" do
        visit current_user
        expect(page).to have_content('Name:')
      end

      it "should have the base title" do
        visit current_user
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "Follow Recipes" do
      describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end
end
