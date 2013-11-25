require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :name => "MyString",
      :picture => "MyString",
      :interests => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_picture[name=?]", "user[picture]"
      assert_select "textarea#user_interests[name=?]", "user[interests]"
    end
  end
end
