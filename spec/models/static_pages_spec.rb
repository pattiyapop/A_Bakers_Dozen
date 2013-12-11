

describe "Static pages" do

    describe "Home page" do
      before { visit recipes_path }

      it "should have the h1 'A Baker's Dozen'" do
        expect(page).to have_content('A social recipe-sharing site')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
  
      it "should not have the custom page title" do
        expect(page).not_to have_title('| Home')
      end
    end

    describe "All Comments page" do
      before { visit comments_path }

      it "should have h1 'A Baker's Dozen'" do
        expect(page).to have_content('Recipe 	User 	Content 	Rating')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "My Recipes page" do
      before { visit recipes_path }

      it "should have h1 'A Baker's Dozen'" do
        expect(page).to have_content('Post New Recipe')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "My Friends page" do
      before { visit users_path }

      it "should have h1 'A Baker's Dozen'" do
        expect(page).to have_content('Username 	Name 	Picture 	Interests')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "Log-in page" do
      before { visit signin_path }

      it "should have h1 'A Baker's Dozen'" do
        expect(page).to have_content('New user? Sign up now!')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "Log-out page" do
      before { visit signout_path }
      it "should have h1 'A Baker's Dozen'" do
        expect(page).to have_content('You have been logged out.')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
    end

    describe "Profile page" do
      before { visit current_user }

      it "should have h1 'A Baker's Dozen'" do
        expect(page).to have_content('Name:')
      end

      it "should have the base title" do
        expect(page).to have_title("A Baker's Dozen")
      end
    end
end
